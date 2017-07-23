$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

# Maintain your gem's version:
require 'system_cat/version'
require 'date'

Gem::Specification.new do |s|
  s.name        = 'system_cat'
  s.version     = SystemCat::Version.new.to_s
  s.date        = Date.today.to_s
  s.licenses    = ['MIT']
  s.summary     = 'Random collection of system tools'
  s.description = 'Utilities for interacting with the shell, git, and versioning'
  s.authors     = ['Rich Humphrey']
  s.email       = 'rich@schrodingersbox.com'
  s.files       = Dir['lib/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.md']
  s.homepage    = 'https://github.com/schrodingersbox/system_cat'
  s.require_path = ['lib']

  s.add_dependency 'require_all', '~> 0'

  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.add_development_dependency 'spec_cat', '~> 3.0', '>= 3.0.0'
  s.add_development_dependency 'simplecov', '~> 0'
  s.add_development_dependency 'coveralls', '~> 0'
end
