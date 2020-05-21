class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy
  accepts_nested_attributes_for :ordered_products
  # orderのデータと同時にordered_productsのデータを保存する際に必要
end
