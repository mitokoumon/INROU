class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :carts, dependent: :destroy

  def address_all
    self.post_code + self.address + self.family_name + self.last_name
  end
  # カートのとこでの住所全般を書くのを楽にするため
end
