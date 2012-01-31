# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "capistrano-cloudfoundry/version"

Gem::Specification.new do |s|
  s.name        = "capistrano-cloudfoundry"
  s.version     = "0.0.1"
  s.authors     = ["Colin Humphreys"]
  s.homepage    = "https://github.com/hatofmonkeys/capistrano-cloudfoundry"
  s.summary     = "#{s.name}-#{s.version}"
  s.description = "Deploy to CloudFoundry using Capistrano"
  s.license     = 'MIT'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path = "lib"

  s.add_development_dependency "cucumber"
  s.add_development_dependency "capybara"
  s.add_development_dependency "capybara-mechanize", "~> 0.3.0.rc3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_dependency "capistrano"
  s.add_dependency "vmc"
  s.add_dependency "capistrano-ext"
end
