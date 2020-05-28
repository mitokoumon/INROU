require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @order = create :order
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@order).to be_valid
      end
    end
    context "データが保存されない" do
      it "宛名なし" do
        @order.name = ""
        expect(@order).to be_invalid
        expect(@order.errors[:name]).to include("can't be blank")
      end
      it "宛先住所なし" do
        @order.address = ""
        expect(@order).to be_invalid
        expect(@order.errors[:address]).to include("can't be blank")
      end
      it "支払い方法なし" do
        @order.payment = ""
        expect(@order).to be_invalid
        expect(@order.errors[:payment]).to include("can't be blank")
      end
      it "郵便番号6桁" do
        @order.post_code = "123456"
        expect(@order).to be_invalid
        expect(@order.errors[:post_code]).to include("is the wrong length (should be 7 characters)")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Order.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
