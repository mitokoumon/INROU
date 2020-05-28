class ProductComment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :rate, :title, presence: true
end
