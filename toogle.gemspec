lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "toogle/version"

Gem::Specification.new do |spec|
  spec.name          = "toogle"
  spec.version       = Toogle::VERSION
  spec.authors       = ["Naya Willis"]
  spec.email         = ["greedybrain18@gmail.com"]
  spec.date          = "2019-11-17"
  spec.summary       = "Take your traditional google searching \"DOWN\" a level by using Terminal Google aka Toogle"
  spec.description   = "With this gem, you can get only the most relevant results for your 'google' search \"who cares about a page 100,000\"."
  spec.homepage      = "https://github.com/greedybrain/toogle"
  spec.license       = "MIT"
  spec.files         = ["lib/toogle.rb", "lib/toogle/version.rb", "lib/toogle/art.rb", "lib/toogle/cli.rb", "lib/toogle/query.rb", "lib/toogle/scraper.rb", "config/env.rb"]
  spec.executables << "toogle"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/greedybrain/toogle"
  spec.metadata["changelog_uri"] = "https://github.com/greedybrain/toogle"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
