# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "email-validator/version"

Gem::Specification.new do |s|
  s.name        = "email-validator"
  s.version     = Email::Validator::VERSION
  s.authors     = ["Ryan Sonnek"]
  s.email       = ["ryan@socialcast.com"]
  s.homepage    = ""
  s.summary     = %q{validate that email attribute contains valid email}
  s.description = %q{ActiveRecord validator to validate that email attribute contains valid email}

  s.rubyforge_project = "email-validator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<activerecord>, [">= 2.2.3"])
  s.add_development_dependency(%q<mocha>, ["0.10.0"])
  s.add_development_dependency(%q<shoulda-context>, ["1.0.0"])
  s.add_development_dependency(%q<rake>, ["0.9.2.2"])
  s.add_development_dependency(%q<sqlite3>, ["1.3.4"])
end
