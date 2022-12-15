# frozen_string_literal: true

FactoryBot.define do
  factory :banner, class: 'CrossPromotionApp::Banner' do
    name { FFaker::Lorem.word }
    link { FFaker::Internet.http_url }
    active { true }
  end
end
