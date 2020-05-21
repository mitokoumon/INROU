class Receiver < ApplicationRecord
  belongs_to :user

  def address_all
    self.post_code + self.address + self.name
  end
end
