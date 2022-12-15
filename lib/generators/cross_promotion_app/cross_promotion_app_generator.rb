# frozen_string_literal: true

require 'rails/generators/base'
require 'rails/generators/active_record'

module CrossPromotionApp
  module Generators
    class CrossPromotionAppGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)

      def mount_engine
        route("mount CrossPromotionApp::Engine, at: '/cross_promotion_app'")
      end

      def migrate_db
        rake('cross_promotion_app:install:migrations')
        rake('db:migrate')
      end

      def create_banner
        copy_file('images/b2b_banner.png', 'app/assets/images/b2b_banner.png')
        rake('cross_promotion_app:create_banner')
        remove_file('app/assets/images/b2b_banner.png')
      end

      def add_banner_to_authentication_controller
        if File.exist?('app/controllers/authenticated_controller.rb')
          inject_into_file('app/controllers/authenticated_controller.rb', after: 'include ShopifyApp::Authenticated') do
            "\n  include CrossPromotionApp::FindBanner"
          end
        else
          p '    Error: AuthenticatedController not found. Please include the following line manually to your controllers: include CrossPromotionApp::FindBanner' # rubocop:disable Layout/LineLength
        end
      end

      def add_banner_to_layout
        if File.readlines('app/views/layouts/embedded_app.html.erb').grep(/<div class="app-content">/).any?
          inject_into_file('app/views/layouts/embedded_app.html.erb', after: '<div class="app-content">') do
            "\n        <%= render 'cross_promotion_app/banner' %>"
          end
        else
          p '    Error: Please add manually the following line to your layout: <%= render "cross_promotion_app/banner" %>' # rubocop:disable Layout/LineLength
        end
      end

      def add_basic_auth_credentials
        file = File.exist?('.env') ? '.env' : '.env.development'
        unless File.readlines(file).grep(/CROSS_PROMOTION_USER/).any?
          append_to_file(file, "\n\nCROSS_PROMOTION_USER=eg-admin\nCROSS_PROMOTION_PASSWORD=#{SecureRandom.hex(10)}")
        end
  
        return unless File.exist?('.env.sample') && File.readlines(file).grep(/CROSS_PROMOTION_USER/).none?
  
        append_to_file('.env.sample', "\n\nCROSS_PROMOTION_USER=\nCROSS_PROMOTION_PASSWORD=}")
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
