# frozen_string_literal: true

Rails.application.routes.draw do
  mount CrossPromotionBanner::Engine => '/'
  mount CrossPromotionBanner::Admin::Engine => '/admin'
end
