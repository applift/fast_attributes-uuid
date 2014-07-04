# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fast_attributes/uuid/version'

Gem::Specification.new do |spec|
  spec.name          = 'fast_attributes-uuid'
  spec.version       = FastAttributes::UUID::VERSION
  spec.authors       = ['Kostiantyn Stepaniuk']
  spec.email         = ['ks@applift.com']
  spec.summary       = 'Add UUID type to fast_attributes'
  spec.description   = 'Add UUID type to fast_attributes'
  spec.homepage      = 'https://github.com/applift/fast_attributes-uuid'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_runtime_dependency 'fast_attributes', '~> 0.2.2'
  spec.add_runtime_dependency 'uuidtools',       '~> 2.1.4'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec',   '~> 3.0.0'
end
