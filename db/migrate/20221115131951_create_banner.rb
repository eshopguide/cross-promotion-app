class CreateBanner < ActiveRecord::Migration[7.0]
  def change
    create_table :banners do |t|
      t.string :name
      t.string :image
      t.string :link
      t.boolean :dismissible, default: true
      t.boolean :active, default: false
      t.timestamps
    end
  end
end
