# frozen_string_literal: true

require_relative "lib/e_invoice_api/version"

Gem::Specification.new do |s|
  s.name = "e-invoice-api"
  s.version = EInvoiceAPI::VERSION
  s.summary = "Ruby SDK for the e-invoice.be Peppol API"
  s.authors = ["e-invoice"]
  s.email = "support@e-invoice.be"
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
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
