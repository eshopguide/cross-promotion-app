# frozen_string_literal: true

Rails.application.routes.draw do
  mount CrossPromotionApp::Engine, at: '/cross_promotion_app'
  root to: 'home#index'
end
