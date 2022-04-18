# frozen_string_literal: true

require_relative 'lib/b2/version'

Gem::Specification.new do |s|
  s.name = 'b2'
  s.version = B2::VERSION
  s.date = '2020-04-21'
  s.authors = ['Jaime Victoria']
  s.email = ['jaime.victoria.90@gmail.com']
  s.summary = 'backblaze b2 client'
  s.homepage = 'https://github.com/jaime-evr/b2'
  s.description = 'Ruby client for the Backblaze B2 API'
  s.license = 'MIT'
  s.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'httparty', '~> 0.18.0'
  s.add_development_dependency 'minitest', '~> 5.14.0'
  s.add_development_dependency 'pry', '~> 0.12.2'
  s.add_development_dependency 'rdoc', '~> 6.3.1'
  s.add_development_dependency 'rubocop'
end
