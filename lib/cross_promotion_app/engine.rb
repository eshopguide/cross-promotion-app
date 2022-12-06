# frozen_string_literal: true

require 'importmap-rails'

module CrossPromotionApp
  class Engine < ::Rails::Engine
    engine_name 'cross_promotion_app'
    isolate_namespace CrossPromotionApp

    initializer 'cross_promotion_app.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << Engine.root.join('config/initializers/importmap.rb')
    end
  end
end
