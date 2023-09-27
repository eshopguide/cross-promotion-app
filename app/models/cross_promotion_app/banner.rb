# frozen_string_literal: true

module CrossPromotionApp
  class Banner < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    validates :name, :title_de, :title_en, :text_de, :text_en, :cta_url, :cta_text_de, :cta_text_en, presence: true
    validates :name, uniqueness: true
    validate :image_type

    def as_json
      ActiveStorage::Current.url_options = { host: ENV.fetch('APP_HOME', nil) }
      super.merge(image_url: image.url)
    end

    private

    def image_type
      errors.add(:image, I18n.t('activerecord.errors.models.messages.blank')) if image.attached? == false
      return if image.content_type.in?(%w[image/svg+xml image/png])

      errors.add(:image, I18n.t('activerecord.errors.models.messages.format'))
    end
  end
end
