# frozen_string_literal: true

require 'webpacker/helper'

module CrossPromotionApp
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      CrossPromotionApp.webpacker
    end
  end
end
