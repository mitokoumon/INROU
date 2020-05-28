class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :family_name, :last_name, :family_name_kana, :last_name_kana, :address, :telephone_number, presence: true
  validates :post_code,length:{is:7}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :receivers, dependent: :destroy
  has_many :carts, dependent: :destroy

  def User.search(search)
    User.where(['family_name LIKE ?', "%#{search}%"]).or(User.where(['last_name LIKE ?', "%#{search}%"])).or(User.where(['family_name_kana LIKE ?', "%#{search}%"])).or(User.where(['last_name_kana LIKE ?', "%#{search}%"]))
  end




  def address_all
    self.post_code + self.address + self.family_name + self.last_name
  end
  # selfの部分にUserが入る
   # カートのとこでの住所全般を書くのを楽にするため
end
