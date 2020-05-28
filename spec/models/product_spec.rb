require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'バリデーションのテスト' do
    before do
      # @category = create :category
      @product = build :product
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@product).to be_valid
        # @userが存在、valid(ある)のか
      end
    end
    context "データが保存されない" do
      it "名前なし" do
        @product.name = ""
        expect(@product).to be_invalid
        expect(@product.errors[:name]).to include("can't be blank")
      end
      it "商品説明なし" do
        @product.text = ""
        expect(@product).to be_invalid
        expect(@product.errors[:text]).to include("can't be blank")
      end
      it "単価なし" do
        @product.now_price = ""
        expect(@product).to be_invalid
        expect(@product.errors[:now_price]).to include("can't be blank")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Categoryモデルとの関係' do
      it 'N:1となっている' do
        expect(Product.reflect_on_association(:category).macro).to eq :belongs_to
      end
    end
  end
end
