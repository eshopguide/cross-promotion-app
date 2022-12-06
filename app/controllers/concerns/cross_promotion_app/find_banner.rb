# frozen_string_literal: true

module CrossPromotionApp
  module FindBanner
    extend ActiveSupport::Concern

    included do
      before_action :cross_promotion_banner

      private

      def cross_promotion_banner
        @cross_promotion_banner ||= CrossPromotionApp::Banner.where(active: true).first
      end
    end
  end
end
