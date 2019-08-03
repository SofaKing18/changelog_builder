# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'changelog_builder/version'

Gem::Specification.new do |spec|
  spec.name          = 'changelog_builder'
  spec.version       = ChangelogBuilder::VERSION
  spec.authors       = ['d.shpagin']
  spec.email         = ['d.shpagin@fun-box.ru']

  spec.summary       = 'ODOT: Write a short summary, because RubyGems requires one.'
  spec.description   = 'ODOT: Write a longer description or delete this line.'
  spec.homepage      = 'http://github.com'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "ODOT: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = 'http://github.com'
  spec.metadata['source_code_uri'] = 'http://github.com'
  spec.metadata['changelog_uri'] = 'http://github.com'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_dependency 'oj'
end
