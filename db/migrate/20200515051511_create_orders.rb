class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :post_code
      t.string :address
      t.string :name
      t.integer :total_price
      t.integer :shipping_fee
      t.integer :payment
      t.integer :flag

      t.timestamps
    end
  end
end
