require 'rails_helper'

RSpec.describe OrderedProduct, type: :model do
  describe 'バリデーションのテスト' do
    before do
      # @user = create :user
      # @order = create :order
      # @category = create :category
      # @product = create :product
      @ordered_product = build :ordered_product
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@ordered_product).to be_valid
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Productモデルとの関係' do
      it 'N:1となっている' do
        expect(OrderedProduct.reflect_on_association(:order).macro).to eq :belongs_to
      end
    end
    context 'Orderモデルとの関係' do
      it 'N:1となっている' do
        expect(OrderedProduct.reflect_on_association(:product).macro).to eq :belongs_to
      end
    end
  end
end
