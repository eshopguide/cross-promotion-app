# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update banner' do
  let!(:banner) { create(:banner) }

  before do
    page.driver.browser.authorize(ENV.fetch('CROSS_PROMOTION_USER'), ENV.fetch('CROSS_PROMOTION_PASSWORD'))
    visit cross_promotion_app.banners_index_path
    click_link(I18n.t('views.index.actions.edit'))
  end

  context 'with valid data' do
    let(:name) { FFaker::Lorem.word }
    let(:link) { FFaker::Internet.http_url }

    before do
      within('form') do
        fill_in(I18n.t('activerecord.attributes.cross_promotion_app/banner.name'), with: name)
        fill_in(I18n.t('activerecord.attributes.cross_promotion_app/banner.link'), with: link)
        attach_file(I18n.t('activerecord.attributes.cross_promotion_app/banner.image'), 'spec/fixtures/banner.png')
        click_button(I18n.t('views.edit.actions.submit'))
      end
    end

    it { expect(page).to have_current_path('/cross_promotion_app') }
    it { expect(page).to have_content(name) }
    it { expect(page).to have_link(href: link) }
    it { expect(page).to have_selector(:css, "img[src*='#{main_app.url_for('banner.png')}']") }
  end

  context 'with invalid data' do
    before do
      within('form') do
        fill_in(I18n.t('activerecord.attributes.cross_promotion_app/banner.name'), with: '')
        fill_in(I18n.t('activerecord.attributes.cross_promotion_app/banner.link'), with: '')
        attach_file(I18n.t('activerecord.attributes.cross_promotion_app/banner.image'), 'spec/fixtures/banner.jpg')
        click_button(I18n.t('views.edit.actions.submit'))
      end
    end

    it { expect(page).to have_current_path(cross_promotion_app.banners_update_path(banner)) }
    it { expect(page).to have_content(I18n.t('errors.messages.blank'), count: 2) }
    it { expect(page).to have_content(I18n.t('activerecord.errors.models.messages.blank')) }
  end
end
