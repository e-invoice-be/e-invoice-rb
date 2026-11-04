# frozen_string_literal: true

# Coverage configuration, auto-loaded by `require "simplecov"` (see
# test/e_invoice_api/test_helper.rb, which calls `SimpleCov.start`).
# Set `COVERAGE=0` to skip measurement entirely.
SimpleCov.configure do
  enable_coverage(:branch)

  # Report on lib/ only; files never required still show up at 0%.
  cover("lib/**/*.rb")
  skip(%r{\A/?(test|rbi|sig|examples)/})

  coverage_dir("coverage")
  # The HTML formatter also writes coverage/coverage.json (machine-readable).
  formats(:html)

  # Floors a couple of points below the measured baseline. With the Prism
  # mock-server resource tests running (PRISM_MOCK=1, as in CI) the baseline is
  # 95.27% line / 63.20% branch; without them it is 92.69% / 60.56%. Only
  # enforced on a full-suite run: a `TEST=path/to/file_test.rb` run covers far less.
  unless ENV.key?("TEST")
    with_mock = ENV["PRISM_MOCK"] == "1"
    coverage(:line, minimum: with_mock ? 94 : 90)
    coverage(:branch, minimum: with_mock ? 62 : 58)
  end
end
