class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_image
      t.text :introduction
      t.integer :price
      t.string :image_id

      t.timestamps
    end
  end
end
