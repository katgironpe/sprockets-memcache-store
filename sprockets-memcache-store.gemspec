# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "sprockets-memcache-store"
  spec.version       = '0.0.2'
  spec.authors       = ["Alex MacCaw"]
  spec.email         = ["maccman@gmail.com"]
  spec.description   = %q{A Memcache store for Sprockets using Dalli}
  spec.summary       = %q{A Memcache store for Sprockets using Dalli}
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "dalli"
  spec.add_dependency "sprockets", '~>2.12'
end
