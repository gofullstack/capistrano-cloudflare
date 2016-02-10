# -*- encoding: utf-8 -*-
require File.expand_path('../lib/capistrano/cloudflare/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nathan L Smith", "Tristan D Havelick"]
  gem.email         = ["nlloyds@gmail.com", "tristan@havelick.com"]
  gem.description   = %q{Capistrano extensions for CloudFlare}
  gem.summary       = %q{Lets you make CloudFlare API calls when deploying with Capistrano.}
  gem.homepage      = "https://github.com/cramerdev/capistrano-cloudflare"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "capistrano-cloudflare"
  gem.require_paths = ["lib"]
  gem.version       = Capistrano::CloudFlare::VERSION

  gem.add_dependency 'capistrano', '>= 2.0'
  gem.add_dependency 'json'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'capistrano-spec'
  gem.add_development_dependency 'webmock'
end
