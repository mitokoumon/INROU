class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :product_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  attachment :image

  validates :name, :text, :now_price, presence: true

  def Product.search(search)
    Product.where(['name LIKE ?', "%#{search}%"])
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
