#!/usr/bin/env ruby
# frozen_string_literal: true

# Structural consistency check between the three hand-maintained trees:
#
#   lib/e_invoice_api/**/*.rb   (implementation + YARD docs)
#   rbi/e_invoice_api/**/*.rbi  (Sorbet signatures)
#   sig/e_invoice_api/**/*.rbs  (RBS signatures)
#
# 1. File level: every `lib/**/*.rb` has a matching `rbi/**/*.rbi` and
#    `sig/**/*.rbs`, and every rbi/rbs file has a matching lib file.
# 2. Model level: for every (direct or indirect) subclass of
#    `EInvoiceAPI::Internal::Type::BaseModel`, the field names declared in lib with
#    `required :x` / `optional :x` equal the attributes declared in rbi and rbs, and
#    the class itself exists in all three trees. An attribute is either an
#    `attr_accessor/attr_reader/attr_writer` declaration or a getter/setter method
#    pair (`def x` + `def x=`), which is how fields of a model that subclasses
#    another model are spelled (e.g. `DocumentCreateParams < DocumentCreate`).
#
# Usage: bundle exec ruby scripts/utils/check-parity.rb
# Exits non-zero and lists every mismatch when the trees drift apart.

require "pathname"
require "prism"
require "rbs"

ROOT = Pathname(__dir__).join("..", "..").expand_path

# Files that legitimately exist in only one tree. Paths are relative to the tree
# root (`lib/`, `rbi/`, `sig/`) without extension.
ALLOW_ONLY_IN_LIB = {
  # Entry point: only `require`s the rest of the library and defines nothing
  # that needs a signature (the `EInvoiceAPI` module itself is declared by every
  # rbi/rbs file).
  "e_invoice_api" => "require-only entry point"
}.freeze
ALLOW_ONLY_IN_RBI = {}.freeze
ALLOW_ONLY_IN_SIG = {}.freeze

BASE_MODEL = "EInvoiceAPI::Internal::Type::BaseModel"
ATTR_METHODS = [:attr_accessor, :attr_reader, :attr_writer].freeze
FIELD_METHODS = [:required, :optional].freeze

def rel_files(dir, ext)
  base = ROOT.join(dir)
  Dir.glob("**/*.#{ext}", base: base).to_set { _1.delete_suffix(".#{ext}") }
end

# Walks a Prism AST, tracking the lexical class/module nesting, and yields
# `[qualified_class_name, superclass_source, call_node]` for every call that sits
# directly in a class body (not inside a method or block).
class ClassBodyVisitor < Prism::Visitor
  attr_reader :classes

  def initialize(methods)
    super()
    @methods = methods
    @stack = []
    # name => {superclass:, names: Set, file:}
    @classes = {}
  end

  def visit_module_node(node)
    nest(node.constant_path.slice) { super }
  end

  def visit_class_node(node)
    nest(node.constant_path.slice) do
      entry = (@classes[current] ||= {superclass: nil, names: Set.new, defs: Set.new, file: @file})
      entry[:superclass] ||= node.superclass&.slice
      super
    end
  end

  def visit_call_node(node)
    if node.receiver.nil? && @methods.include?(node.name) && @classes.key?(current)
      node.arguments&.arguments&.each do |arg|
        @classes.fetch(current)[:names] << arg.unescaped.to_sym if arg.is_a?(Prism::SymbolNode)
      end
    end
    super
  end

  # record instance method names, but don't descend into method bodies or
  # blocks: only class-body declarations count
  def visit_def_node(node)
    @classes.fetch(current)[:defs] << node.name if node.receiver.nil? && @classes.key?(current)
  end

  def visit_block_node(_) = nil

  def parse_file(path)
    @file = path
    result = Prism.parse_file(path.to_s)
    raise "#{path}: #{result.errors.map(&:message).join(', ')}" unless result.success?
    result.value.accept(self)
  end

  private

  def current = @stack.join("::")

  def nest(name)
    @stack.push(name)
    yield
  ensure
    @stack.pop
  end
end

def prism_classes(dir, ext, methods)
  visitor = ClassBodyVisitor.new(methods)
  Dir.glob(ROOT.join(dir, "**", "*.#{ext}").to_s).each { visitor.parse_file(Pathname(_1)) }
  visitor.classes
end

def rbs_classes
  classes = {}
  walk = lambda do |decls, prefix, file|
    decls.each do |decl|
      case decl
      in RBS::AST::Declarations::Class | RBS::AST::Declarations::Module
        name = [*prefix, decl.name.to_s.delete_prefix("::")].join("::")
        if decl.is_a?(RBS::AST::Declarations::Class)
          entry = (classes[name] ||= {superclass: nil, names: Set.new, defs: Set.new, file: file})
          entry[:superclass] ||= decl.super_class&.name.to_s.delete_prefix("::").then { _1.empty? ? nil : _1 }
          decl.members.each do |m|
            case m
            in RBS::AST::Members::AttrAccessor | RBS::AST::Members::AttrReader | RBS::AST::Members::AttrWriter
              entry[:names] << m.name
            in RBS::AST::Members::MethodDefinition if m.kind == :instance
              entry[:defs] << m.name
            else
              nil
            end
          end
        end
        walk.call(decl.members, [name], file)
      else
        nil
      end
    end
  end
  Dir.glob(ROOT.join("sig", "**", "*.rbs").to_s).each do |path|
    _, _, decls = RBS::Parser.parse_signature(File.read(path))
    walk.call(decls, [], Pathname(path))
  end
  classes
end

errors = []

# -- 1. file level ------------------------------------------------------------

lib = rel_files("lib", "rb")
rbi = rel_files("rbi", "rbi")
sig = rel_files("sig", "rbs")

errors.concat((lib - rbi - ALLOW_ONLY_IN_LIB.keys).sort.map { "missing rbi/#{_1}.rbi (for lib/#{_1}.rb)" })
errors.concat((lib - sig - ALLOW_ONLY_IN_LIB.keys).sort.map { "missing sig/#{_1}.rbs (for lib/#{_1}.rb)" })
errors.concat((rbi - lib - ALLOW_ONLY_IN_RBI.keys).sort.map { "orphan rbi/#{_1}.rbi (no lib/#{_1}.rb)" })
errors.concat((sig - lib - ALLOW_ONLY_IN_SIG.keys).sort.map { "orphan sig/#{_1}.rbs (no lib/#{_1}.rb)" })

{
  "lib" => [ALLOW_ONLY_IN_LIB, lib],
  "rbi" => [ALLOW_ONLY_IN_RBI, rbi],
  "sig" => [ALLOW_ONLY_IN_SIG, sig]
}.each do |tree, (allow, files)|
  (allow.keys.to_set - files).each do
    errors << "stale allow-list entry for #{tree}/#{_1} in #{Pathname(File.expand_path(__FILE__)).relative_path_from(ROOT)}"
  end
end

# -- 2. model fields ----------------------------------------------------------

trees = {
  "lib" => prism_classes("lib", "rb", FIELD_METHODS),
  "rbi" => prism_classes("rbi", "rbi", ATTR_METHODS),
  "sig" => rbs_classes
}

# a `def x` + `def x=` pair is an attribute too
trees.each_value do |classes|
  classes.each_value do |entry|
    entry[:defs].each { entry[:names] << _1 if entry[:defs].include?(:"#{_1}=") }
  end
end

# superclasses are written fully qualified (`EInvoiceAPI::...`) in all three trees
model = lambda do |classes, name, seen = Set.new|
  sup = classes.dig(name, :superclass)
  next false if sup.nil? || !seen.add?(name)
  sup.delete_prefix("::") == BASE_MODEL || model.call(classes, sup.delete_prefix("::"), seen)
end

models = trees.values.flat_map { |classes| classes.keys.select { model.call(classes, _1) } }.uniq.sort

rel = ->(path) { path.relative_path_from(ROOT).to_s }

models.each do |name|
  lib_entry = trees.fetch("lib")[name]
  trees.each do |tree, classes|
    next if tree == "lib"
    entry = classes[name]

    if lib_entry.nil?
      errors << "#{name}: declared as a model in #{tree} (#{rel.call(entry[:file])}) but not in lib"
      next
    end
    if entry.nil?
      errors << "#{name}: model in lib (#{rel.call(lib_entry[:file])}) is not declared in #{tree}"
      next
    end

    missing = lib_entry[:names] - entry[:names]
    extra = entry[:names] - lib_entry[:names]
    missing.sort.each { errors << "#{name}: field `#{_1}` is in lib but missing from #{rel.call(entry[:file])}" }
    extra.sort.each { errors << "#{name}: attribute `#{_1}` in #{rel.call(entry[:file])} is not a field in lib" }
  end
end

if errors.empty?
  puts("parity: OK (#{lib.size} lib files, #{models.size} models checked against rbi/ and sig/)")
else
  warn("parity: #{errors.size} problem(s) between lib/, rbi/ and sig/:")
  errors.each { warn("  - #{_1}") }
  exit(1)
end
