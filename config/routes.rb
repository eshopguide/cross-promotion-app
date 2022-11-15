# frozen_string_literal: true

CrossPromotionApp::Engine.routes.draw do
  get('/banner', { to: 'banners#show', as: :banner })
end
