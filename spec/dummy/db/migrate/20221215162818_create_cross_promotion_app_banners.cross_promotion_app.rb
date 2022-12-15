# frozen_string_literal: true

# This migration comes from cross_promotion_app (originally 20221205154404)
class CreateCrossPromotionAppBanners < ActiveRecord::Migration[7.0]
  def self.up
    create_table :cross_promotion_app_banners, if_not_exists: true do |t|
      t.string :name
      t.string :link
      t.boolean :active, default: false
      t.timestamps
    end

    add_index :cross_promotion_app_banners, :name, unique: true, if_not_exists: true
  end

  def self.down
    drop_table :cross_promotion_app_banners
  end
end
