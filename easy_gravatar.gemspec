# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_gravatar/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_gravatar"
  spec.version       = EasyGravatar::VERSION
  spec.authors       = ["Dennis van de Hoef"]
  spec.email         = ["dennisvdhoef@gmail.com"]
  spec.summary       = %q{A simple gem that gives you -all- the data avalabile for the user on gravatar.com}
  spec.description   = %q{Gravatar.com, mainly known for its avatar hosting. But users can store more than only an avatar at gravatar. This gem also allows you to easily access it all (accounts at other social networks, more photo's, the name of the user, saved websites, cryptocurrency accounts and more)}
  spec.homepage      = "http://hoefweb.nl/ruby/easy_gravatar/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.2.0"
end
