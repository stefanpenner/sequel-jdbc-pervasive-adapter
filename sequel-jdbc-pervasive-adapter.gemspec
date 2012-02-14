# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sequel-jdbc-pervasive-adapter/version"

Gem::Specification.new do |s|
  s.name        = "sequel-jdbc-pervasive-adapter"
  s.version     = Sequel::Jdbc::Pervasive::Adapter::VERSION
  s.authors     = ["Stefan Penner"]
  s.email       = ["stefan.penner@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Pervasive JDBC Sequel Adapter}
  s.description = %q{Basic Implementation of a Pervasive JDBC Sequel Adapter}

  s.rubyforge_project = "sequel-jdbc-pervasive-adapter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency     "sequel"
end
