# frozen_string_literal: true

require 'rails/generators/base'
require 'rails/generators/active_record'

module CrossPromotionApp
  module Generators
    class CrossPromotionAppGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)

      def create_banner_model
        copy_file('banner.rb', 'app/models/cross_promotion_app/banner.rb')
      end

      def create_banner_migration
        migration_template('db/migrate/create_cross_promotion_app_banners.erb',
                           'db/migrate/create_cross_promotion_app_banners.rb')
      end

      def migrate_db
        rake('db:migrate')
      end

      def create_banner
        copy_file('images/b2b_banner.png', 'app/assets/images/b2b_banner.png')
        rake('cross_promotion_app:create_banner')
        remove_file('app/assets/images/b2b_banner.png')
      end

      def mount_engine
        route("mount CrossPromotionApp::Engine, at: '/'")
      end

      def add_banner_to_authentication_controller
        inject_into_file('app/controllers/authenticated_controller.rb', after: 'include ShopifyApp::Authenticated') do
          "\n  include CrossPromotionApp::FindBanner"
        end
      end

      def add_banner_to_layout
        inject_into_file('app/views/layouts/embedded_app.html.erb', after: '<div class="app-content">') do
          "\n        <%= render 'cross_promotion_app/banner' %>"
        end
      end

      def create_banner_view
        copy_file('views/_banner.html.erb', 'app/views/cross_promotion_app/_banner.html.erb')
      end

      private

      def rails_migration_version
        Rails.version.match(/\d\.\d/)[0]
      end

      class << self
        private :next_migration_number

        # for generating a timestamp when using `create_migration`
        def next_migration_number(dir)
          ActiveRecord::Generators::Base.next_migration_number(dir)
        end
      end
    end
  end
end
