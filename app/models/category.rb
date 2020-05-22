class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name,:flag, presence: true
end
