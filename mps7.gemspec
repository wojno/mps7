# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mps7/version'

Gem::Specification.new do |spec|
  spec.name          = 'mps7'
  spec.version       = Mps7::VERSION
  spec.authors       = ['Ryan Wojno']
  spec.email         = ['wojno2112@gmail.com']

  spec.summary       = %q{Binary protocol format consumption agent for the old-school mainframe MPS7}
  spec.description   = %q{Binary protocol format consumption agent for the old-school mainframe, MPS7.  Reads proprietary binary for payment processing.}
  spec.homepage      = ''

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency             'activemodel', '~> 5.0', '>= 5.0.2'
  spec.add_development_dependency 'bundler',     '~> 1.13'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.4'
  spec.add_development_dependency 'minitest',    '~> 5.0'
  spec.add_development_dependency 'pry',         '~> 0.10.4'
  spec.add_development_dependency 'rake',        '~> 10.0'
  spec.add_development_dependency 'simplecov',   '~> 0.14.1'
end
