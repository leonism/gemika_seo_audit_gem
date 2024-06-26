# frozen_string_literal: true

require_relative "lib/gemika_seo_audit_gem/version"

Gem::Specification.new do |spec|
  spec.name = "gemika_seo_audit_gem"
  spec.version = GemikaSeoAuditGem::VERSION
  spec.authors = ["gerry leo nugroho"]
  spec.email = ["gerryleonugroho@gmail.com"]

  spec.summary       = %q{Comprehensive SEO audit tools for Ruby applications.}
  spec.description   = %q{This gem provides a robust suite of SEO analysis tools designed to help developers optimize their Ruby-based websites for search engines. Features include keyword analysis, mobile-friendliness checks, structured data validation, and much more.}
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  # Dependencies
  spec.add_runtime_dependency "nokogiri", "~> 1.11"
  spec.add_runtime_dependency "faraday", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"

end
