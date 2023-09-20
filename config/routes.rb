# frozen_string_literal: true

CrossPromotionApp::Engine.routes.draw do
  default_url_options({ host: ENV.fetch('HOST_NAME'), protocol: 'https' })

  get '/', to: 'banners#index', as: 'banners_index'
  get 'banners/new', to: 'banners#new'
  post 'banners/create', to: 'banners#create'
  get 'banners/:id/edit', to: 'banners#edit', as: 'banners_edit'
  patch 'banners/:id/update', to: 'banners#update', as: 'banners_update'
  get 'banners/:id/activate', to: 'banners#activate', as: 'banners_activate'
  get 'banners/:id/deactivate', to: 'banners#deactivate', as: 'banners_deactivate'
  get 'banners/:id/destroy', to: 'banners#destroy', as: 'banners_destroy'
  get 'api/banner', to: 'banners#api'
end
