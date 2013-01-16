# -*- encoding: utf-8 -*-
require File.expand_path('../lib/devise_account_expireable/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Justin McNally", "Brendten Eickstaedt"]
  gem.email         = ["justin@kohactive.com", "brendten@brendteneickstaedt.com"]
  gem.description   = %q{Expire a user's account at a certain date}
  gem.summary       = %q{At a certain date make a user's account not work}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "devise_account_expireable"
  gem.require_paths = ["lib"]
  gem.version       = DeviseAccountExpireable::VERSION

  gem.add_dependency(%q<devise>, [">= 2.0.4"])
  gem.add_dependency(%q<rails>, [">= 3.2"])
end
