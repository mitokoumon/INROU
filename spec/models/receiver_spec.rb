require 'rails_helper'

RSpec.describe Receiver, type: :model do
  context "データが正しく保存される" do
    before do
      @user = create :user
      @receiver = Receiver.new
      # @receiver.id = 1
      @receiver.user_id = @user.id
      @receiver.post_code = "1234567"
      @receiver.address = "石川県"
      @receiver.name ="酒井龍樹"
      @receiver.save
    end
    it "全て入力してあるので保存される" do
      expect(@receiver).to be_valid
    end
  end
end


# @user = User.new
#       @user.email = "1@1"
#       @user.family_name = "aaa"
#       @user.last_name = "aaa"
#       @user.family_name_kana = "aaa"
#       @user.last_name_kana = "aaa"
#       @user.post_code = "1234567"
#       @user.address = "124"
#       @user.telephone_number = "123"
#       @user.flag = 1
#       @user.password = "123456"
#       @user.password_confirmation = "123456"
#       @user.save
# @user = create :user　と同義