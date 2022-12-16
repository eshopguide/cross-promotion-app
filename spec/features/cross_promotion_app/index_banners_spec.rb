# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List banners' do
  let!(:banner) { create(:banner) }

  before do
    page.driver.browser.authorize(ENV.fetch('CROSS_PROMOTION_USER'), ENV.fetch('CROSS_PROMOTION_PASSWORD'))
    visit cross_promotion_app.banners_index_path
  end

  it { expect(page).to have_content(I18n.t('views.index.title')) }
  it { expect(page).to have_selector(:css, "img[src*='#{main_app.url_for(banner.image)}']") }
  it { expect(page).to have_link(href: banner.link) }
end
