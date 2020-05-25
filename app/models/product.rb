class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :image

  validates :name, :text, :now_price, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
