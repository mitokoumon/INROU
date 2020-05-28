require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'バリデーションのテスト' do
    before do
      # @user = create :user
      # @category = create :category
      # @product = create :product
      @cart = build :cart
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@cart).to be_valid
      end
    end
    context "データが保存されない" do
      it "購入個数が入力されない" do
        @cart.number = ""
        expect(@cart).to be_invalid
        expect(@cart.errors[:number]).to include("can't be blank")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Cart.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Productモデルとの関係' do
      it 'N:1となっている' do
        expect(Cart.reflect_on_association(:product).macro).to eq :belongs_to
      end
    end
  end
end
