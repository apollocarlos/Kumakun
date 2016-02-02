# -*- encoding: utf-8 -*-
# stub: bing_translator 4.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "bing_translator"
  s.version = "4.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ricky Elrod"]
  s.date = "2015-08-19"
  s.description = "Translate strings using the Bing HTTP API. Requires that you have a Client ID and Secret. See README.md for information."
  s.email = "ricky@elrod.me"
  s.homepage = "https://www.github.com/relrod/bing_translator-gem"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.1"
  s.summary = "Translate using the Bing HTTP API"

  s.installed_by_version = "2.4.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_runtime_dependency(%q<json>, ["~> 1.8.0"])
      s.add_runtime_dependency(%q<savon>, ["~> 2.0"])
    else
      s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
      s.add_dependency(%q<json>, ["~> 1.8.0"])
      s.add_dependency(%q<savon>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["~> 1.6.0"])
    s.add_dependency(%q<json>, ["~> 1.8.0"])
    s.add_dependency(%q<savon>, ["~> 2.0"])
  end
end
