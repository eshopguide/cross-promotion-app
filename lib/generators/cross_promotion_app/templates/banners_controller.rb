# frozen_string_literal: true

module CrossPromotionApp
  class BannersController < ApplicationController
    before_action :find_banner, only: :show

    def show; end

    private

    def find_banner
      @banner = CrossPromotionApp::Banner.first
    end
  end
end
