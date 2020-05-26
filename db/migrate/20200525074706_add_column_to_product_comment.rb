class AddColumnToProductComment < ActiveRecord::Migration[5.2]
  def change
    add_column :product_comments, :title, :string
    add_column :product_comments, :rate, :float
  end
end
