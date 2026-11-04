# frozen_string_literal: true

require "etc"
require "pathname"
require "securerandom"
require "shellwords"
require "tmpdir"

require "minitest/test_task"
require "rake/clean"
require "rubocop/rake_task"

tapioca = "sorbet/tapioca"
examples = "examples"
ignore_file = ".ignore"

FILES_ENV = "FORMAT_FILE"

CLEAN.push(*%w[.idea/ .ruby-lsp/ .yardoc/ doc/], *FileList["*.gem"], ignore_file)

CLOBBER.push(*%w[sorbet/rbi/annotations/ sorbet/rbi/gems/], tapioca)

multitask(:default) do
  sh(*%w[rake --tasks])
end

desc("Preview docs; use `PORT=<PORT>` to change the port")
multitask(:"docs:preview") do
  sh(*%w[yard server --reload --quiet --bind [::] --port], ENV.fetch("PORT", "8808"))
end

desc("Run test suites; use `TEST=path/to/test.rb` to run a specific test file")
multitask(:test) do
  rb =
    FileList[ENV.fetch("TEST", "./test/**/*_test.rb")]
    .map { "require_relative(#{_1.dump});" }
    .join

  ruby(*%w[-w -e], rb, verbose: false) { fail unless _1 }
end

# Cap parallelism at the CPU count. `--max-procs=0` spawns one process per
# 300-file batch with no upper bound; on large SDKs (thousands of files) that
# oversubscribes CPUs and stacks up rubocop processes, exhausting memory and
# slowing CI to the point of timing out.
xargs = %W[xargs --no-run-if-empty --null --max-procs=#{Etc.nprocessors} --max-args=300 --]
ruby_opt = {"RUBYOPT" => [ENV["RUBYOPT"], "--encoding=UTF-8"].compact.join(" ")}

filtered = ->(ext, dirs) do
  if ENV.key?(FILES_ENV)
    %w[sed -E -n -e] << "/\\.#{ext}$/p" << "--" << ENV.fetch(FILES_ENV)
  else
    (%w[find] + dirs + %w[-type f -and -name]) << "*.#{ext}" << "-print0"
  end
end

desc("Lint `*.rb(i)`")
multitask(:"lint:rubocop") do
  find = %w[find ./lib ./test ./rbi ./examples -type f -and ( -name *.rb -or -name *.rbi ) -print0]

  rubocop = %w[rubocop]
  rubocop += %w[--format github] if ENV.key?("CI")

  # some lines cannot be shortened
  rubocop += %w[--except Lint/RedundantCopDisableDirective,Layout/LineLength]

  lint = xargs + rubocop
  sh("#{find.shelljoin} | #{lint.shelljoin}")
end

norm_lines = %w[tr -- \n \0].shelljoin

desc("Format `*.rb`")
multitask(:"format:rb") do
  # while `syntax_tree` is much faster than `rubocop`, `rubocop` is the only formatter with full syntax support
  files = filtered["rb", %w[./lib ./test ./examples]]
  fmt = xargs + %w[rubocop --fail-level F --autocorrect --format simple --]
  sh("#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}")
end

desc("Format `*.rbi`")
multitask(:"format:rbi") do
  files = filtered["rbi", %w[./rbi]]
  fmt = xargs + %w[stree write --]
  sh(ruby_opt, "#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}")
end

desc("Format `*.rbs`")
multitask(:"format:rbs") do
  files = filtered["rbs", %w[./sig]]
  inplace = /darwin|bsd/ =~ RUBY_PLATFORM ? ["-i", ""] : %w[-i]
  uuid = SecureRandom.uuid

  # `syntax_tree` has trouble with `rbs`'s class & module aliases

  sed_bin = /darwin/ =~ RUBY_PLATFORM ? "/usr/bin/sed" : "sed"
  sed = xargs + [sed_bin, "-E", *inplace, "-e"]
  # annotate unprocessable aliases with a unique comment
  pre = sed + ["s/(class|module) ([^ ]+) = (.+$)/# \\1 #{uuid}\\n\\2: \\3/", "--"]
  fmt = xargs + %w[stree write --plugin=rbs --]
  # remove the unique comment and unprocessable aliases to type aliases
  subst = <<~SED
    s/# (class|module) #{uuid}/\\1/
    t l1
    b

    : l1
    N
    s/\\n *([^:]+): (.+)$/ \\1 = \\2/
  SED
  # for each line:
  #   1. try transform the unique comment into `class | module`, if successful, branch to label `l1`.
  #   2. at label `l1`, join previously annotated line with `class | module` information.
  pst = sed + [subst, "--"]

  success = false

  # transform class aliases to type aliases, which syntax tree has no trouble with
  sh("#{files.shelljoin} | #{norm_lines} | #{pre.shelljoin}")
  # run syntax tree to format `*.rbs` files
  sh(ruby_opt, "#{files.shelljoin} | #{norm_lines} | #{fmt.shelljoin}") do
    success = _1
  end
  # transform type aliases back to class aliases
  sh("#{files.shelljoin} | #{norm_lines} | #{pst.shelljoin}")

  # always run post-processing to remove comment marker
  fail unless success
end

desc("Format everything")
multitask(format: [:"format:rb", :"format:rbi", :"format:rbs"])

desc("Check formatting: runs `rake format` on a temp copy of the tree and diffs it; never rewrites the working tree")
multitask(:"format:check") do
  dirs = %w[lib test examples rbi sig].select { File.directory?(_1) }

  Dir.mktmpdir("format-check-") do |tmp|
    cp_r(dirs, tmp, verbose: false)
    cp(%w[Rakefile .rubocop.yml], tmp, verbose: false)

    # quiet: only the diff matters; `FORMAT_FILE` would point at paths in the original tree
    sh({FILES_ENV => nil}, "rake format >/dev/null 2>&1", chdir: tmp) do |ok, _|
      fail("`rake format` failed on the temp copy; run `./scripts/format` to see why") unless ok
    end

    clean = true
    dirs.each do |dir|
      sh(*%w[diff -ru --], dir, File.join(tmp, dir), verbose: false) { |ok, _| clean &&= ok }
    end
    fail("formatting is not clean; run `./scripts/format` (diff above, `+` is the formatted version)") unless clean
  end
end

desc("Check that lib/, rbi/ and sig/ are in sync (matching files, model fields)")
multitask(:"lint:parity") do
  ruby("scripts/utils/check-parity.rb")
end

desc("Audit Gemfile.lock for vulnerable gems (fetches the advisory database; network)")
multitask(:audit) do
  sh(*%w[bundle-audit check --update])
end

desc("Check yard docs: fail on any yard warning; prints documentation coverage (`yard stats --list-undoc` lists the gaps)")
multitask(:"docs:check") do
  # `stats` parses everything `yard doc` does, so it reports the same warnings; nothing is written to disk
  sh(*%w[yard stats --no-save --no-cache --fail-on-warning])
  # a tag YARD cannot parse becomes literal text, and `yard stats` does not warn about it
  ruby("scripts/utils/check-yard-literal-tags.rb")
end

desc("Typecheck `*.rbs`")
multitask(:"typecheck:steep") do
  sh(*%w[steep check])
end

directory(examples)

desc("Typecheck `*.rbi`")
multitask("typecheck:sorbet": examples) do
  sh(*%w[srb typecheck --dir], examples)
end

directory(tapioca) do
  sh(*%w[tapioca init])
end

desc("Typecheck everything")
multitask(typecheck: [:"typecheck:steep", :"typecheck:sorbet"])

desc("Lint and typecheck")
multitask(lint: [:"lint:rubocop", :"lint:parity", :"format:check", :typecheck])

desc("Build yard docs")
multitask(:"build:docs") do
  sh(*%w[yard])
end

desc("Build ruby gem")
multitask(:"build:gem") do
  # optimizing for grepping through the gem bundle: many tools honour `.ignore` files, including VSCode
  #
  # both `rbi` and `sig` directories are navigable by their respective tool chains and therefore can be ignored by tools such as `rg`
  Pathname(ignore_file).write(<<~GLOB)
    rbi/*
    sig/*
  GLOB

  sh(*%w[gem build -- e_invoice_api.gemspec])
  rm_rf(ignore_file)
end

desc("Build the gem into a temp dir, install it in isolation and require it")
multitask(:"build:gem:check") do
  Dir.mktmpdir("gem-check-") do |tmp|
    gem_file = File.join(tmp, "e-invoice-api.gem")
    gem_home = File.join(tmp, "gems")

    # same `.ignore` as `build:gem`, as it is part of the gemspec `files`
    created_ignore = !File.exist?(ignore_file)
    begin
      Pathname(ignore_file).write("rbi/*\nsig/*\n") if created_ignore
      sh(*%w[gem build --strict --quiet e_invoice_api.gemspec --output], gem_file)
    ensure
      rm_f(ignore_file, verbose: false) if created_ignore
    end

    # dependencies are resolved from the current gem path, so the SDK itself is the only thing under test
    sh(*%w[gem install --local --ignore-dependencies --no-document --install-dir], gem_home, gem_file)

    # run outside of bundler, with the temp dir first on the gem path (the rest only provides dependencies)
    gem_path = [gem_home, *Gem.path].uniq.join(File::PATH_SEPARATOR)
    env = {"GEM_HOME" => gem_home, "GEM_PATH" => gem_path, "RUBYOPT" => nil, "RUBYLIB" => nil}
    env.merge!(ENV.keys.grep(/\ABUNDLE(R)?_/).to_h { [_1, nil] })
    smoke = File.expand_path("scripts/utils/check-installed-gem.rb")
    sh(env, RbConfig.ruby, smoke, Dir.pwd, chdir: tmp, verbose: false)
  end
end

desc("Release ruby gem")
multitask(release: [:"build:gem"]) do
  sh(*%w[gem push], *FileList["*.gem"])
end
