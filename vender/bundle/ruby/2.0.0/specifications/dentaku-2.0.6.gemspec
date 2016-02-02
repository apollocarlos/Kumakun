# -*- encoding: utf-8 -*-
# stub: dentaku 2.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "dentaku"
  s.version = "2.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Solomon White"]
  s.date = "2016-01-26"
  s.description = "    Dentaku is a parser and evaluator for mathematical formulas\n"
  s.email = ["rubysolo@gmail.com"]
  s.homepage = "http://github.com/rubysolo/dentaku"
  s.licenses = ["MIT"]
  s.rubyforge_project = "dentaku"
  s.rubygems_version = "2.4.1"
  s.summary = "A formula language parser and evaluator"

  s.installed_by_version = "2.4.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
