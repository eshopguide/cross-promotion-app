class AddFieldsToBanners < ActiveRecord::Migration[7.0]
  def change
    add_column :cross_promotion_app_banners, :title_de, :string
    add_column :cross_promotion_app_banners, :title_en, :string
    add_column :cross_promotion_app_banners, :text_de, :string
    add_column :cross_promotion_app_banners, :text_en, :string
    add_column :cross_promotion_app_banners, :link_text_de, :string
    add_column :cross_promotion_app_banners, :link_text_en, :string
    add_column :cross_promotion_app_banners, :cta_text_de, :string
    add_column :cross_promotion_app_banners, :cta_text_en, :string
    add_column :cross_promotion_app_banners, :cta_url, :string
    add_column :cross_promotion_app_banners, :video_id, :string
    add_column :cross_promotion_app_banners, :video_length, :integer
  end
end
