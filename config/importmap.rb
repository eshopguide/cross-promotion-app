# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap
pin 'cross_promotion_app', preload: true
pin_all_from 'app/javascript/cross_promotion_app', under: 'cross_promotion_app'

pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true

# polaris view components
pin 'polaris-view-components', to: 'polaris_view_components.js'
pin '@rails/request.js', to: '@rails--request.js.js' # @0.0.6
