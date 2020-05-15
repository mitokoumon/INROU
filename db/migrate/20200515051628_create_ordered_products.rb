class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :number
      t.integer :flag
      t.integer :price

      t.timestamps
    end
  end
end
