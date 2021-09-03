class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :image_url
      t.string :name
      t.string :url
      t.string :price
      t.string :item_code
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
