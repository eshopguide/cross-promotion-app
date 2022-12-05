# frozen_string_literal: true

module CrossPromotionApp
  class Banner < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    validates :name, :link, presence: true
    validates :name, uniqueness: true
    validate :image_type

    private

    def image_type
      errors.add(:image, I18n.t('activerecord.errors.models.messages.blank')) if image.attached? == false
      return if image.content_type.in?(%w[image/svg+xml image/png])

      errors.add(:image, I18n.t('activerecord.errors.models.messages.format'))
    end
  end
end
