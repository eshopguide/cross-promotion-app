# frozen_string_literal: true

Rails.application.routes.draw do
  mount CrossPromotionApp::Engine => '/'
end
