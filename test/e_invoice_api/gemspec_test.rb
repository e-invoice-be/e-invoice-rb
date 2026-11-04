# frozen_string_literal: true

require_relative "test_helper"

class EInvoiceAPI::Test::GemspecTest < Minitest::Test
  def spec
    @spec ||= Gem::Specification.load(File.expand_path("../../e_invoice_api.gemspec", __dir__))
  end

  def test_license_matches_license_file
    assert_equal(["Apache-2.0"], spec.licenses)
    assert_match(/Apache License\s+Version 2\.0/, File.read(File.expand_path("../../LICENSE", __dir__)))
  end

  def test_runtime_dependencies_are_bounded
    deps = spec.runtime_dependencies
    refute_empty(deps)
    deps.each do |dep|
      upper = dep.requirement.requirements.any? { |op, _| %w[< <= ~> =].include?(op) }
      assert(upper, "#{dep.name} (#{dep.requirement}) has no upper bound")
    end
  end
end
