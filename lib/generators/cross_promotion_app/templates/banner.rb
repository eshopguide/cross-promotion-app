# frozen_string_literal: true

module CrossPromotionApp
  class Banner < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    validates :name, :link, presence: true
    validate :image_type

    private

    def image_type
      errors.add(:image, 'is missing!') if image.attached? == false
      errors.add(:image, 'needs to be a jpeg or png!') unless image.content_type.in?(%('image/jpeg image/png'))
    end
  end
end
