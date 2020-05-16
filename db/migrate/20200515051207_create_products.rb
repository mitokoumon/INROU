class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.text :text
      t.string :image_id
      t.integer :now_price

      t.timestamps
    end
  end
end
