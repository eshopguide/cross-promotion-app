# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'cross_promotion_banner/version'

Gem::Specification.new do |spec|
  spec.name = 'cross_promotion_banner'
  spec.version = CrossPromotionBanner::VERSION
  spec.licenses = ['Nonstandard']
  spec.authors = ['Eshop Guide GmbH']
  spec.email = ['info@eshop-guide.de']
  spec.homepage = 'https://github.com/eshopguide/eg-cross-promotion-banner'
  spec.summary = 'Eshop Guide cross promotion banner engine'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib,spec/factories,spec/features,spec/models,spec/lib/**/*', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'pg', '~> 1.1'
  spec.add_dependency 'rails', '~> 7.0.0'

  spec.add_development_dependency 'dotenv-rails', '~> 2.8'
  spec.add_development_dependency 'factory_bot', '~> 6.2'
  spec.add_development_dependency 'rspec-rails', '~> 6.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.15'
  spec.add_development_dependency 'rubocop-rails', '~> 2.17'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.15'
  spec.add_development_dependency 'simplecov', '~> 0.21'
end
