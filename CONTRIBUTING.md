## Setting up the environment

This repository contains a `.ruby-version` file, which should work with either [rbenv](https://github.com/rbenv/rbenv) or [asdf](https://github.com/asdf-vm/asdf) with the [ruby plugin](https://github.com/asdf-vm/asdf-ruby).

Please follow the instructions for your preferred version manager to install the Ruby version specified in the `.ruby-version` file.

To set up the repository, run:

```bash
$ ./scripts/bootstrap
```

This will install all the required dependencies.

## Modifying/Adding code

Most of the SDK is generated code. Modifications to code will be persisted between generations, but may result in merge conflicts between manual patches and changes from the generator. The generator will never modify the contents of `lib/e_invoice_api/helpers/` and `examples/` directory.

## Adding and running examples

All files in the `examples/` directory are not modified by the generator and can be freely edited or added to.

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
  missing from the gemspec.
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

Stainless generates the `@param` tags at the method level. After a Stainless sync, check the doc comments with
`rake docs:check` before you merge.

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
