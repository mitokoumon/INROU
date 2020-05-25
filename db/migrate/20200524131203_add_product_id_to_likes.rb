class AddProductIdToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :product_id, :integer
  end
end
