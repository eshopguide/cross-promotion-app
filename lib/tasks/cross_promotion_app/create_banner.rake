# frozen_string_literal: true

namespace :cross_promotion_app do
  desc 'Create a banner for the app'
  task create_banner: :environment do
    exit if CrossPromotionApp::Banner.exists?(name: 'B2B Banner')

    banner_attrs = { name: 'B2B Banner',
                     link: 'https://www.eshop-guide.de/blogs/shopify-deutschland/shopify-b2b-b2c-kunden-verkaufen' }
    banner = CrossPromotionApp::Banner.new(banner_attrs)
    banner.image.attach(io: Rails.root.join('app/assets/images/test_banner.png').open, filename: 'test_banner.png',
                        content_type: 'image/png')
    banner.save
  end
end
