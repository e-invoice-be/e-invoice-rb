# frozen_string_literal: true

# Smoke test for an installed `e-invoice-api` gem, used by `rake build:gem:check`.
#
# Usage: GEM_HOME=<dir> GEM_PATH=<dir>:... ruby scripts/utils/check-installed-gem.rb <checkout>
#
# Must run outside of bundler, with the gem installed in `GEM_HOME`. Checks that:
# - the gem is loaded from `GEM_HOME`, not from the checkout
# - every lib/rbi/sig file in the checkout is packaged (catches gemspec `files` gaps)
# - `require "e_invoice_api"` loads every packaged `lib/` file
# - a client can be constructed

checkout = ARGV.fetch(0)
gem_home = ENV.fetch("GEM_HOME")
globs = %w[lib/**/*.rb rbi/**/*.rbi sig/**/*.rbs]

abort("run outside of bundler") if defined?(Bundler)

gem("e-invoice-api")
require("e_invoice_api")

spec = Gem.loaded_specs.fetch("e-invoice-api")
root = spec.full_gem_path
abort("loaded from #{root}, expected a path under #{gem_home}") unless root.start_with?(gem_home)

missing = Dir.glob(globs, base: checkout) - Dir.glob(globs, base: root)
unless missing.empty?
  abort("files in the checkout but missing from the gem (check the gemspec `files`):\n  #{missing.sort.join("\n  ")}")
end

unloaded = Dir.glob("lib/**/*.rb", base: root).map { File.join(root, _1) } - $LOADED_FEATURES
unless unloaded.empty?
  abort("files in the gem not loaded by `require \"e_invoice_api\"`:\n  #{unloaded.sort.join("\n  ")}")
end

EInvoiceAPI::Client.new(api_key: "gem-check")

files = Dir.glob("**/*", File::FNM_DOTMATCH, base: root).count { File.file?(File.join(root, _1)) }
puts("gem check: OK (e-invoice-api #{EInvoiceAPI::VERSION}, #{files} files, loaded from #{root})")
