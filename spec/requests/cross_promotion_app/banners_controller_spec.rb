# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CrossPromotionApp::BannersController do
  before do
    set_basic_auth_header
    get cross_promotion_app.banners_index_path, headers: @headers
  end

  describe "GET 'index'" do
    it 'is successful' do
      expect(response).to be_successful
    end
  end
end
