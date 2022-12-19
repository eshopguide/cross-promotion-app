# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List banners' do
  let!(:banner) { create(:banner) }
  let!(:banner2) { create(:banner, active: false) }
  let(:first_banner) { all('.cpa-banner-wrapper').first }
  let(:second_banner) { all('.cpa-banner-wrapper').last }

  before do
    page.driver.browser.authorize(ENV.fetch('CROSS_PROMOTION_USER'), ENV.fetch('CROSS_PROMOTION_PASSWORD'))
    visit cross_promotion_app.banners_index_path
  end

  it { expect(page).to have_content(I18n.t('views.index.title')) }
  it { expect(page).to have_css('div.cpa-banner-wrapper', count: 2) }

  it { expect(first_banner).to have_content(banner.name) }
  it { expect(first_banner).to have_content(I18n.t('views.index.badges.active')) }
  it { expect(first_banner).to have_selector(:css, "img[src*='#{main_app.url_for(banner.image)}']") }
  it { expect(first_banner).to have_link(href: banner.link) }
  it { expect(first_banner).to have_link(href: cross_promotion_app.banners_edit_path(banner)) }

  it { expect(page).to have_link(href: cross_promotion_app.banners_new_path) }

  describe 'activating a banner' do
    before do
      within(all('.cpa-banner-wrapper').last) { click_link(I18n.t('views.index.actions.activate')) }
    end

    it { expect(page).to have_current_path('/cross_promotion_app') }
    it { expect(first_banner).to have_content(banner2.name) }
    it { expect(first_banner).to have_content(I18n.t('views.index.badges.active')) }
    it { expect(second_banner).to have_content(banner.name) }
    it { expect(second_banner).not_to have_content(I18n.t('views.index.badges.active')) }
  end

  describe 'deactivating a banner' do
    before do
      within(all('.cpa-banner-wrapper').first) { click_link(I18n.t('views.index.actions.deactivate')) }
    end

    it { expect(page).to have_current_path('/cross_promotion_app') }
    it { expect(page).to have_css('div.cpa-banner-wrapper', count: 2) }
    it { expect(page).not_to have_content(I18n.t('views.index.badges.active')) }
  end

  describe 'deleting a banner' do
    before do
      within(all('.cpa-banner-wrapper').last) { click_link(I18n.t('views.index.actions.destroy')) }
    end

    it { expect(page).to have_current_path('/cross_promotion_app') }
    it { expect(page).to have_css('div.cpa-banner-wrapper', count: 1) }
    it { expect(page).not_to have_content(banner2.name) }
  end
end
