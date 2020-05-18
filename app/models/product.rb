class Product < ApplicationRecord
  belongs_to :category
  has_many :ordered_products, dependent: :destroy
  has_many :carts, dependent: :destroy
  attachment :image
end
