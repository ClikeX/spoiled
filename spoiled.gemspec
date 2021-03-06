# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spoiled/version'

Gem::Specification.new do |spec|
  spec.name          = "spoiled"
  spec.version       = Spoiled::VERSION
  spec.authors       = ["ClikeX\n\n"]
  spec.email         = ["w.s.van.der.meulen@gmail.com"]

  spec.summary       = "Spoiled is a small tool to check SSL expiration dates"
  spec.description   = "Spoiled is a small tool to check SSL expiration dates"
  spec.homepage      = "https://github.com/ClikeX/spoiled"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'thor', '~> 0.19.1'
  spec.add_runtime_dependency "activesupport", "~> 4.0"


  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
