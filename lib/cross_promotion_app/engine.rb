# frozen_string_literal: true
require 'importmap-rails'

module CrossPromotionApp
  class Engine < ::Rails::Engine
    engine_name 'cross_promotion_app'
    isolate_namespace CrossPromotionApp

    initializer 'cross_promotion_app.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << root.join('config/importmap.rb')
      app.config.importmap.cache_sweepers << root.join('app/assets/javascripts')
    end

    initializer 'cross_promotion_app.assets' do |app|
      app.config.assets.precompile += %w[cross_promotion_app_manifest]
    end
  end
end
