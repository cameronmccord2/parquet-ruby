require_relative "lib/parquet/version"

Gem::Specification.new do |spec|
  spec.name = "parquet-tyfoom"
  spec.version = Parquet::VERSION
  spec.authors = ["Nathan Jaremko", "Cameron McCord"]
  spec.email = ["nathan@jaremko.ca", "cameron.mccord@tyfoom.com"]

  spec.summary = "Tyfoom fork of the parquet gem (Rust), with incremental streaming writes"
  spec.description = <<-EOF
    Tyfoom's fork of the `parquet` gem (github.com/njaremko/parquet-ruby), published while the
    incremental streaming-write fix is pending upstream. It wraps the official Apache Rust
    implementation and bounds write memory by streaming row groups to disk instead of buffering the
    whole file. Drop-in compatible with the upstream gem: the library is still required as
    `require "parquet"` and exposes the same `Parquet` API.
  EOF
  spec.homepage = "https://github.com/cameronmccord2/parquet-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cameronmccord2/parquet-ruby"
  spec.metadata["readme_uri"] = "https://github.com/cameronmccord2/parquet-ruby/blob/stream-writes-incrementally/README.md"
  spec.metadata["changelog_uri"] = "https://github.com/cameronmccord2/parquet-ruby/blob/stream-writes-incrementally/CHANGELOG.md"
  spec.metadata["documentation_uri"] = "https://www.rubydoc.info/gems/parquet-tyfoom"
  spec.metadata["funding_uri"] = "https://github.com/sponsors/njaremko"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.files =
    Dir[
      "{ext,lib}/**/*",
      "LICENSE",
      "README.md",
      "Cargo.*",
      "Gemfile",
      "Rakefile"
    ]
  spec.require_paths = ["lib"]

  spec.extensions = ["ext/parquet/extconf.rb"]

  # needed until rubygems supports Rust support is out of beta
  spec.add_dependency "rb_sys", "~> 0.9.39"

  # Not included in Ruby standard library anymore
  spec.add_dependency "bigdecimal"

  # only needed when developing or packaging your gem
  spec.add_development_dependency "rake-compiler", "~> 1.2.0"
end
