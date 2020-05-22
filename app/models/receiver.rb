class Receiver < ApplicationRecord
  belongs_to :user

  def address_all
    self.post_code + self.address + self.name
  end
  # selfにReciverが入る
    validates :name, :address, presence: true
    validates :post_code,length:{is:7}

end
