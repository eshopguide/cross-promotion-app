# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show banner' do
  context 'with active banner' do
    let!(:banner) { create(:banner) }

    before { visit root_path }

    it { expect(page).to have_selector(:css, "img[src*='#{main_app.url_for(banner.image)}']") }
    it { expect(page).to have_link(href: banner.link) }
  end

  context 'when the banner is not active' do
    let!(:banner) { create(:banner, active: false) }

    before { visit root_path }

    it { expect(page).not_to have_selector(:css, 'img') }
    it { expect(page).not_to have_link(href: banner.link) }
  end
end
