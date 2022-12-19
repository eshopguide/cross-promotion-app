# frozen_string_literal: true

FactoryBot.define do
  factory :banner, class: 'CrossPromotionApp::Banner' do
    name { FFaker::Lorem.word }
    link { FFaker::Internet.http_url }
    image { Rack::Test::UploadedFile.new('spec/fixtures/banner.png', 'image/png') }
    active { true }
  end
end
