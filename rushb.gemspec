# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rushb/version'

Gem::Specification.new do |spec|
  spec.name          = "rushb"
  spec.version       = Rushb::VERSION
  spec.homepage      = "https://github.com/akdarrah/rushb-ruby"
  spec.summary       = "Rushb Ruby Bindings"
  spec.description   = "Rushb ELO Ranking System"
  spec.authors       = ["CHALLONGE! LLC"]
  spec.email         = 'developers@challonge.com'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
