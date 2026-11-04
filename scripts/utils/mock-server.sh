# shellcheck shell=bash
#
# Sourced by scripts/test. Makes sure a Prism mock server is available for the
# resource tests in test/e_invoice_api/resources, which only run when
# PRISM_MOCK=1 and are skipped otherwise.
#
#   PRISM_MOCK unset  best effort: use the server at TEST_API_BASE_URL if one is
#                     listening, else start one with scripts/mock if npm is
#                     installed; if neither works, warn and skip those tests.
#   PRISM_MOCK=1      required (use this in CI): as above, but fail if no
#                     server is available.
#   PRISM_MOCK=0      don't use or start a mock server; skip those tests.
#
# TEST_API_BASE_URL defaults to http://localhost:4010. A mock server is only
# started for that default URL; OPENAPI_SPEC_URL overrides the spec it serves.
# A server started here is stopped when scripts/test exits.

_mock_red='\033[0;31m'
_mock_green='\033[0;32m'
_mock_yellow='\033[0;33m'
_mock_nc='\033[0m'

_mock_base_url="${TEST_API_BASE_URL:-http://localhost:4010}"

_mock_server_is_running() {
  # Any HTTP response (Prism answers 404 on /) means something is listening.
  curl --silent --max-time 5 --output /dev/null "$_mock_base_url"
}

_mock_unavailable() {
  if [ "${PRISM_MOCK:-}" == "1" ]; then
    echo -e "${_mock_red}ERROR:${_mock_nc} PRISM_MOCK=1 but no mock server is available at ${_mock_base_url}: $1" >&2
    exit 1
  fi
  echo -e "${_mock_yellow}WARNING:${_mock_nc} $1" >&2
  echo -e "The resource tests will be skipped. Install Node.js 20.19+ with npm, or run" >&2
  echo -e "  \$ ${_mock_yellow}./scripts/mock${_mock_nc}" >&2
  echo -e "in another terminal, to run them against a Prism mock of the OpenAPI spec." >&2
  echo >&2
  export PRISM_MOCK=0
}

# scripts/mock writes the process group ID of the server it starts here.
export PRISM_PID_FILE="${TMPDIR:-/tmp}/e-invoice-prism-test-$$.pid"

_mock_stop_server() {
  if [ -f "$PRISM_PID_FILE" ]; then
    kill -- -"$(cat "$PRISM_PID_FILE")" 2>/dev/null || true
    rm -f "$PRISM_PID_FILE"
  fi
}

if [ "${PRISM_MOCK:-}" == "0" ]; then
  echo -e "${_mock_yellow}PRISM_MOCK=0: skipping the resource tests${_mock_nc}"
  echo
elif _mock_server_is_running; then
  echo -e "${_mock_green}✔ Running the resource tests against the server at ${_mock_base_url}${_mock_nc}"
  echo
  export PRISM_MOCK=1
elif [ -n "${TEST_API_BASE_URL:-}" ] && [ "$TEST_API_BASE_URL" != "http://localhost:4010" ]; then
  _mock_unavailable "nothing is listening at TEST_API_BASE_URL=${TEST_API_BASE_URL}"
elif ! command -v npm >/dev/null 2>&1; then
  _mock_unavailable "npm is not installed, so no Prism mock server can be started"
else
  trap _mock_stop_server EXIT
  if ./scripts/mock --daemon && _mock_server_is_running; then
    echo -e "${_mock_green}✔ Prism mock server is running${_mock_nc}"
    echo
    export PRISM_MOCK=1
  else
    _mock_stop_server
    _mock_unavailable "the Prism mock server failed to start (see .prism.log)"
  fi
fi
