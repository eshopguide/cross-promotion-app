# frozen_string_literal: true

require 'cross_promotion_app'

if CrossPromotionApp.use_importmap?
  CrossPromotionApp.configuration.importmap.draw do
    pin 'application', to: 'cross_promotion_app/cross_promomotion_app.js', preload: true
    pin_all_from CrossPromotionApp::Engine.root.join('app/assets/javascripts/cross_promotion_app/controllers'),
                 under: 'controllers', to: 'cross_promotion_app/controllers'
  
    pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
    pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
    pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
  
    # polaris view components
    pin 'polaris-view-components', to: 'polaris_view_components.js'
    pin '@rails/request.js', to: '@rails--request.js.js' # @0.0.6
  end
end
