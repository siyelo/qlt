# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qlt/version'

Gem::Specification.new do |spec|
  spec.name          = "qlt"
  spec.version       = Qlt::VERSION
  spec.authors       = ["Siyelo"]
  spec.email         = ["dev@siyelo.com"]

  spec.summary       = %q{Internet Solutions QLT API Wrapper}
  spec.description   = %q{Internet Solutions QLT API Wrapper.}
  spec.homepage      = "http://github.com/siyelo/qlt"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
