# frozen_string_literal: true

# Loads an installed `e-invoice-api` gem through bundler, used by `rake build:gem:check`.
#
# Usage: GEM_HOME=<dir> GEM_PATH=<dir>:... ruby scripts/utils/check-bundled-gem.rb <app dir> <version>
#
# Must run outside of bundler, with the gem installed in `GEM_HOME`. Writes a Gemfile with only the SDK in
# `<app dir>`, then requires the SDK with `bundle exec`. Bundler hides every gem that the gemspec does not
# declare, such as bundled gems (`base64` since ruby 3.4), which the development dependencies otherwise pull
# in. Any output fails the check too, as some rubies only warn about those.

require "open3"
require "rbconfig"

app = ARGV.fetch(0)
version = ARGV.fetch(1)

abort("run outside of bundler") if defined?(Bundler)

File.write(File.join(app, "Gemfile"), <<~GEMFILE)
  source "https://rubygems.org"
  gem "e-invoice-api", "= #{version}"
GEMFILE

bundle = [RbConfig.ruby, Gem.bin_path("bundler", "bundle")]
env = {"BUNDLE_GEMFILE" => File.join(app, "Gemfile")}
system(env, *bundle, *%w[install --local --quiet], chdir: app, exception: true)

load_sdk = <<~RUBY
  require "e_invoice_api"
  root = Gem.loaded_specs.fetch("e-invoice-api").full_gem_path
  abort("loaded from \#{root}, expected a path under \#{ENV.fetch("GEM_HOME")}") unless root.start_with?(ENV.fetch("GEM_HOME"))
  EInvoiceAPI::Client.new(api_key: "gem-check")
RUBY
out, status = Open3.capture2e(env, *bundle, *%w[exec ruby -e], load_sdk, chdir: app)
unless status.success? && out.empty?
  abort("`require \"e_invoice_api\"` with only the SDK in the Gemfile failed or warned:\n#{out}")
end

puts("gem check: OK (bundler, only e-invoice-api #{version} in the Gemfile)")
