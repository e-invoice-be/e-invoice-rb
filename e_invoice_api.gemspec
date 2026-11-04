# frozen_string_literal: true

require_relative "lib/e_invoice_api/version"

Gem::Specification.new do |s|
  s.name = "e-invoice-api"
  s.version = EInvoiceAPI::VERSION
  s.summary = "Ruby SDK for the e-invoice.be Peppol API"
  s.authors = ["e-invoice"]
  s.email = "support@e-invoice.be"
  s.license = "Apache-2.0"
  s.homepage = "https://gemdocs.org/gems/e-invoice-api"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/e-invoice-be/e-invoice-rb"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  # widest ranges the test suite passes with on Ruby 3.2-3.4; see #83
  s.add_dependency "cgi", ">= 0.2", "< 1"
  # connection_pool 3.0.0 is a broken release (it is missing `connection_pool/fork`)
  s.add_dependency "connection_pool", ">= 2.0", "!= 3.0.0", "< 4"
end
