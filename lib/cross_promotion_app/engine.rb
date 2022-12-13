# frozen_string_literal: true

require 'importmap-rails'

module CrossPromotionApp
  class Engine < ::Rails::Engine
    engine_name 'cross_promotion_app'
    isolate_namespace CrossPromotionApp

    initializer 'cross_promotion_app.importmap', before: 'importmap' do |app|
      app.config.importmap.paths << Engine.root.join('config/initializers/importmap.rb')
    end

    config.app_middleware.use(
      Rack::Static,
      # note! this varies from the Webpacker/engine documentation
      urls: ['/cross-promotion-app-packs'], root: CrossPromotionApp::Engine.root.join('public')
    )

    initializer 'webpack.proxy' do |app|
      insert_middleware = begin
        CrossPromotionApp.webpacker.config.dev_server.present?
      rescue StandardError
        nil
      end
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
        ssl_verify_none: true,
        webpacker: CrossPromotionApp.webpacker
      )
    end
  end
end
