class RemoveUserIdFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :user_id, :string
  end
end
