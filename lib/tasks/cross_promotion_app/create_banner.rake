# frozen_string_literal: true

namespace :cross_promotion_app do
  desc 'Create a banner for the app'
  task create_banner: :environment do
    return if CrossPromotionApp::Banner.exists?(name: 'B2B Banner')
    
    banner = CrossPromotionApp::Banner.new(name: 'B2B Banner',
                                               link: 'https://www.eshop-guide.de/blogs/shopify-deutschland/shopify-b2b-b2c-kunden-verkaufen',
                                               dismissible: true,
                                               active: true)
    banner.image.attach(io: Rails.root.join('app/assets/images/b2b_banner.png').open, filename: 'b2b_banner.png',
                        content_type: 'image/png')
    banner.save
  end
end
