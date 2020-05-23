class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  attachment :image

  validates :name, :text, :now_price, presence: true

  def Product.search(search)
    Product.where(['name LIKE ?', "%#{search}%"])
  end
end
