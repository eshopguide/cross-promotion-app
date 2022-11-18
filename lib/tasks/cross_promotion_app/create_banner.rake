# frozen_string_literal: true

namespace :cross_promotion_app do
  namespace :banner do
    desc 'Create a banner for the app'
    task create: :environment do
      banner = CrossPromotionApp::Banner.new(name: 'B2B Banner',
                                             link: 'https://www.eshop-guide.de/blogs/shopify-deutschland/shopify-b2b-b2c-kunden-verkaufen',
                                             dismissible: true,
                                             active: true)
      banner.image.attach(io: Rails.root.join('app/assets/images/b2b_banner.png').open, filename: 'b2b_banner.png',
                          content_type: 'image/png')
      banner.save
    end
  end
end
