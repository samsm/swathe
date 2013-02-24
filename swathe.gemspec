# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swathe/version'

Gem::Specification.new do |gem|
  gem.name          = "swathe"
  gem.version       = Swathe::VERSION
  gem.authors       = ["Sam Schenkman-Moore"]
  gem.email         = ["samsm@samsm.com"]
  gem.description   = %q{An abstraction for dealing with common archive tasks.}
  gem.summary       = %q{Copies files out of archives.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "rubyzip"

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rake"

end
