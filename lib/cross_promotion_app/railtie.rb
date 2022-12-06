# frozen_string_literal: true

module CrossPromotionApp
  class Railtie < Rails::Railtie
    initializer 'cross_promotion_app.assets.precompile' do |app|
      app.config.assets.precompile += %w[cross_promotion_app/manifest]
    end
  end
end
