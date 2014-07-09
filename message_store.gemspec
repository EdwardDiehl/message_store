# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'message_store/version'

Gem::Specification.new do |spec|
  spec.name          = "message_store"
  spec.version       = MessageStore::VERSION
  spec.authors       = ["Edward Diehl"]
  spec.email         = ["EdwDiehl@gmail.com"]
  spec.summary       = %q{Library that stores text data into different key-value storage backends}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0") + Dir['lib/message_store/backends/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
