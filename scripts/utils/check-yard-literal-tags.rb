#!/usr/bin/env ruby
# frozen_string_literal: true

# Fails when a tag survives only as text. `yard stats --fail-on-warning` does not
# catch that. A tag indented under another tag, or a tag indented further than the
# description of a directive (`@!attribute`, `@!method`), is never parsed. The page
# then prints the tag literally, and markdown drops the braces in a type such as
# `Hash{String=>Object}`.
#
# Usage: bundle exec ruby scripts/utils/check-yard-literal-tags.rb

require "pathname"
require "yard"

ROOT = Pathname(__dir__).join("..", "..").expand_path
Dir.chdir(ROOT)

yardoc = YARD::CLI::Yardoc.new
# reads `.yardopts` (custom tags and excluded paths) from the repository root
yardoc.parse_arguments
YARD::Registry.clear
YARD.parse(yardoc.files, yardoc.excluded)

if YARD::Registry.all.empty?
  warn("yard literal tags: parsed no code objects, so this check did not run")
  exit(1)
end

library = YARD::Tags::Library.instance

# Only a known tag counts, so a description line such as `@ivar = 1` is not a match.
literal_tag_names = lambda do |text|
  text.to_s.scan(/^\s*@(!)?(\w+)/).filter_map do |bang, name|
    known = bang ? library.has_directive?(name) : library.has_tag?(name)
    "@#{bang}#{name}" if known
  end
end

literal = []
YARD::Registry.all.each do |object|
  [object.docstring, *object.tags(:overload).map(&:docstring)].each do |docstring|
    next if docstring.nil?

    # An `@example` may show tag lines on purpose. Every other tag's text is scanned,
    # and so is the description. The text of an `@option` tag is on its pair.
    pieces = [["description", docstring]]
    docstring.tags.reject { _1.tag_name == "example" }.each do |tag|
      holder = tag.respond_to?(:pair) ? tag.pair : tag
      where = ["@#{tag.tag_name}", tag.name].compact.join(" ")
      pieces << [where, holder&.text]
    end

    pieces.each do |where, text|
      names = literal_tag_names.call(text)
      next if names.empty?

      literal << "#{object.file}:#{object.line}: #{object.path}: inside #{where} (#{names.uniq.join(', ')})"
    end
  end
end

if literal.empty?
  exit(0)
end

warn(<<~MSG)
  yard literal tags: YARD shows these tags as literal text. The page prints the tag
  instead of an option list, and markdown drops the braces in a type such as Hash{String=>Object}.

  Comment indentation only; do not change code:
  - Put @option at the same indent as the @param it belongs to. Under @overload that is
    two spaces, the same as @param (CONTRIBUTING.md). A Stainless sync indents @option
    under @param; dedent those lines.
  - For a directive (@!attribute, @!method), indent the whole description by two spaces.
    A tag indented further than that description becomes text.
MSG
literal.each { warn(_1) }
exit(1)
