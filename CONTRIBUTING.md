## Setting up the environment

This repository contains a `.ruby-version` file, which should work with either [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) with the [ruby plugin](https://github.com/asdf-vm/asdf-ruby).

Please follow the instructions for your preferred version manager to install the Ruby version specified in the `.ruby-version` file.

To set up the repository, run:

```bash
$ ./scripts/bootstrap
```

This will install all the required dependencies.

## Modifying/Adding code

e-invoice.be maintains this SDK by hand: all of the code, including `lib/`, `rbi/` and `sig/`, is edited directly. Make
your change on a branch, run the checks below, and open a pull request to `main`.

## Adding and running examples

You can freely edit or add files in the `examples/` directory.

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/e_invoice_api"

# ...
```

```bash
$ chmod +x './examples/<your-example>.rb'

# run the example against your api
$ ruby './examples/<your-example>.rb'
```

## Using the repository from source

If you’d like to use the repository from source, you can either install from git or reference a cloned repository:

To install via git in your `Gemfile`:

```ruby
gem "e-invoice-api", git: "https://github.com/e-invoice-be/e-invoice-rb"
```

Alternatively, reference local copy of the repo:

```bash
$ git clone -- 'https://github.com/e-invoice-be/e-invoice-rb' '<path-to-repo>'
```

```ruby
gem "e-invoice-api", path: "<path-to-repo>"
```

## Running commands

Running `rake` by itself will show all runnable commands.

```bash
$ bundle exec rake
```

## Running tests

```bash
$ ./scripts/test
```

The tests under `test/e_invoice_api/resources/` run against a [Prism](https://github.com/stoplightio/prism) mock
of the OpenAPI spec. `./scripts/test` starts one automatically when Node.js 20.19+ (with `npm`) is installed;
otherwise those tests are skipped with a warning. You can also run the mock yourself with `./scripts/mock` (it
serves `$OPENAPI_SPEC_URL`, defaulting to the live spec). Set `PRISM_MOCK=1` to fail instead of skipping
(as CI does), or `PRISM_MOCK=0` to skip them.

### The copy of the OpenAPI spec

CI doesn't mock the live spec: it sets `OPENAPI_SPEC_URL=openapi.json`, a copy of the spec in the repo root, so
that a change to the API or an outage of `api.e-invoice.be` can't break a run, and a run on an old commit gives the
same result. To run the tests locally against the same spec as CI:

```bash
$ OPENAPI_SPEC_URL=openapi.json ./scripts/test
```

(If a mock server is already listening on port 4010, `./scripts/test` uses it instead, whatever spec it serves.)

When you sync the SDK with the API, update the copy in the same pull request:

```bash
$ ./scripts/update-openapi-spec
$ git diff --stat openapi.json
```

The script (which needs `curl` and `python3`) downloads the live spec and writes it pretty-printed, so the diff
shows what changed. Commit `openapi.json` with the SDK changes.

To check whether the copy is out of date, run the **OpenAPI spec drift** workflow from the Actions tab (or
`gh workflow run openapi-spec-drift.yml`). It only runs manually. When the copy differs from the live spec, it
opens an issue with the diff, or updates the open one; the run itself doesn't fail.

Coverage of `lib/` is measured with [SimpleCov](https://github.com/simplecov-ruby/simplecov) and written to
`coverage/index.html`. A full run fails if line or branch coverage falls below the floors in `.simplecov`. Use
`TEST=path/to/file_test.rb` to run a single file (no minimum), or `COVERAGE=0` to skip measurement.

## Linting and formatting

This repository uses [rubocop](https://github.com/rubocop/rubocop) for linting and formatting of `*.rb` files; And [syntax_tree](https://github.com/ruby-syntax-tree/syntax_tree) is used for formatting of both `*.rbi` and `*.rbs` files.

There are two separate type checkers supported by this library: [sorbet](https://github.com/sorbet/sorbet) and [steep](https://github.com/soutaro/steep) are used for verifying `*.rbi` and `*.rbs` files respectively.

To lint and typecheck:

```bash
$ bundle exec rake lint
```

Besides rubocop, sorbet and steep, `rake lint` also runs:

- `lint:parity`: checks that every file in `lib/` has a matching `rbi/` and `sig/` file, and that every model
  declares the same fields in all three trees.
- `format:check`: fails if `rake format` would change anything (it checks a temporary copy and never rewrites
  your files).

Other checks, which CI runs separately:

- `rake audit`: checks `Gemfile.lock` against the Ruby advisory database (needs network).
- `rake build:gem:check`: builds the gem, installs it in isolation and requires it, which catches files
  missing from the gemspec. It then requires it again in a Bundler app with only the SDK in its Gemfile, which
  catches gems the SDK requires but the gemspec does not declare (such as `base64`, a bundled gem since Ruby
  3.4). CI runs it on every Ruby version in the test matrix.
- `rake docs:check`: fails on any YARD warning.

### Doc comments

When a method's real signature differs from the one callers use (for example `def list(params = {})`), its doc
comment has an `@overload` tag with the public signature. Indent the `@param` tags (and their `@option` lines)
by two spaces under the `@overload` tag, so that YARD documents them on the overload. A `@param` tag at the
method level must match a name in the real signature, or `rake docs:check` fails:

```ruby
# Retrieve a document.
#
# @overload retrieve(document_id, request_options: {})
#
#   @param document_id [String]
#
#   @param request_options [EInvoiceAPI::RequestOptions, Hash{Symbol=>Object}, nil]
#
# @return [EInvoiceAPI::Models::DocumentResponse]
def retrieve(document_id, params = {})
```

Keep the `@param` tags under the `@overload` tag when you add or change a method, and run `rake docs:check` before
you merge.

To format and fix all lint issues automatically:

```bash
$ bundle exec rake format
```

## Editor Support

### Ruby LSP

[Ruby LSP](https://github.com/Shopify/ruby-lsp) has quite good support for go to definition, but not auto-completion.

This can be installed along side Solargraph.

### Solargraph

[Solargraph](https://solargraph.org) has quite good support for auto-completion, but not go to definition.

This can be installed along side Ruby LSP.

### Sorbet

[Sorbet](https://sorbet.org) should mostly work out of the box when editing this library directly. However, there are a some caveats due to the colocation of `*.rb` and `*.rbi` files in the same project. These issues should not otherwise manifest when this library is used as a dependency.

1. For go to definition usages, sorbet might get confused and may not always navigate to the correct location.

2. For each generic type in `*.rbi` files, a spurious "Duplicate type member" error is present.

## Documentation Preview

To preview the documentation, run:

```bash
$ bundle exec rake docs:preview [PORT=8808]
```

## Releasing

Releases are manual. The gem on RubyGems is [`e-invoice-api`](https://rubygems.org/gems/e-invoice-api). It follows
[SemVer](https://semver.org/spec/v2.0.0.html); while the major version is `0`, a breaking change increases the minor
version.

1. On a branch from `main`, change the version to `X.Y.Z` in:
   - `lib/e_invoice_api/version.rb` (`EInvoiceAPI::VERSION`; the gemspec and the `User-Agent` header read it).
   - The `Gemfile` snippet in the Installation section of `README.md` (`gem "e-invoice-api", "~> X.Y.Z"`).
   - `Gemfile.lock`: run `bundle install`, which updates the `e-invoice-api (X.Y.Z)` line under `PATH`.
2. In `CHANGELOG.md`, turn the `## Unreleased` section into `## X.Y.Z (YYYY-MM-DD)` (or add that section at the top),
   with a `Full Changelog: [vA.B.C...vX.Y.Z](https://github.com/e-invoice-be/e-invoice-rb/compare/vA.B.C...vX.Y.Z)`
   line like the earlier entries. List breaking changes first, under a `### ⚠ BREAKING CHANGES` heading.
3. Open a pull request titled `release: X.Y.Z` and merge it to `main`.
4. Tag the merge commit on `main` and push the tag:

   ```bash
   $ git checkout main && git pull
   $ git tag vX.Y.Z
   $ git push origin vX.Y.Z
   ```

5. Create a GitHub release from the tag, with the changelog entry as the text:

   ```bash
   $ gh release create vX.Y.Z --title vX.Y.Z --notes-file <file with the changelog entry>
   ```

Publishing the release starts the **Publish Gem** workflow (`.github/workflows/publish-gem.yml`). It checks out the
tag and runs `bin/publish-gem`, which runs `bundle`, deletes any `*.gem` file in the repository root and runs
`rake release`. That task builds the gem from `e_invoice_api.gemspec` (`rake build:gem`) and pushes it to RubyGems
with `gem push`, authenticated by the `E_INVOICE_GEM_HOST_API_KEY` (or `GEM_HOST_API_KEY`) repository or
organization secret. `RUBYGEMS_HOST` is only needed for a private gem server.

If the workflow fails, fix the cause and run it again from the Actions tab (it has a `workflow_dispatch` trigger) or
with `gh workflow run publish-gem.yml --ref vX.Y.Z`. Select the tag as the ref, so that it builds the released commit.
RubyGems refuses to push a version that already exists, so a re-run cannot overwrite a published gem. Afterwards,
check that the new version shows on [RubyGems](https://rubygems.org/gems/e-invoice-api).
