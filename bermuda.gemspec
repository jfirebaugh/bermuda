# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bermuda/version"

Gem::Specification.new do |s|
  s.name        = "bermuda"
  s.version     = Bermuda::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["John Firebaugh"]
  s.email       = ["john.firebaugh@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/bermuda"
  s.summary     = %q{jQuery UI steps for cucumber and capybara}
  s.description = %q{Provides cucumber step definitions for testing jQuery UI widget interactions with capybara}

  s.rubyforge_project = "bermuda"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "cucumber", "~> 0.9.2"
  s.add_dependency "capybara", "~> 0.4.0"

  s.add_development_dependency "rspec", "~> 2.0.0"
end
