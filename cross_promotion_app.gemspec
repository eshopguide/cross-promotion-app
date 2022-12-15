# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'cross_promotion_app/version'

Gem::Specification.new do |spec|
  spec.name = 'cross_promotion_app'
  spec.version = CrossPromotionApp::VERSION
  spec.licenses = ['Nonstandard']
  spec.author = 'Eshop Guide GmbH'
  spec.email = ['info@eshop-guide.de']
  spec.homepage = 'https://github.com/eshopguide/cross-promotion-app'
  spec.summary = 'Eshop Guide cross promotion banner app'
  spec.required_ruby_version = '>= 3.1'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.md']

  spec.add_dependency 'activestorage', '~> 7.0'
  spec.add_dependency 'pg', '~> 1.1'
  spec.add_dependency 'rails', '~> 7.0'
  spec.add_dependency 'turbo-rails', '~> 1.1'

  spec.add_development_dependency 'dotenv-rails', '~> 2.8'
  spec.add_development_dependency 'factory_bot', '~> 6.2'
  spec.add_development_dependency 'rspec-rails', '~> 6.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.15'
  spec.add_development_dependency 'rubocop-rails', '~> 2.17'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.15'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
end
