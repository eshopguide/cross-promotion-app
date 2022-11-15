# frozen_string_literal: true

module CrossPromotionBanner
  module Admin
    class Engine < ::Rails::Engine
      isolate_namespace CrossPromotionBanner::Admin

      config.paths['config/routes.rb'] = 'config/admin/routes.rb'
    end
  end
end
