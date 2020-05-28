require 'rails_helper'

RSpec.describe Receiver, type: :model do
  describe 'バリデーションのテスト' do
    before do
      # @user = create :user
      @receiver = build :receiver
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@receiver).to be_valid
      end
    end
    context "データが保存されない" do
      it "郵便番号6文字" do
        @receiver.post_code = "123456"
        expect(@receiver).to be_invalid
        expect(@receiver.errors[:post_code]).to include("is the wrong length (should be 7 characters)")
      end
      it "住所なし" do
        @receiver.address = ""
        expect(@receiver).to be_invalid
        expect(@receiver.errors[:address]).to include("can't be blank")
      end
      it "宛名なし" do
        @receiver.name = ""
        expect(@receiver).to be_invalid
        expect(@receiver.errors[:name]).to include("can't be blank")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Receiver.reflect_on_association(:user).macro).to eq :belongs_to
      end
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