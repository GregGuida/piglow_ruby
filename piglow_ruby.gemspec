# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'piglow_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "piglow_ruby"
  spec.version       = PiglowRuby::VERSION
  spec.authors       = ["Greg Guida"]
  spec.email         = ["gregory.guida1@gmail.com"]
  spec.summary       = %q{A small gem to operate your Pimoroni Piglow}
#  spec.description   = %q{TODO: Write a longer description. Optional.}
#  spec.homepage      = ""
#  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "i2c", "~> 0.4.0"
end
