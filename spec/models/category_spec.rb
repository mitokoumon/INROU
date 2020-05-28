require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @category = build :category
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@category).to be_valid
      end
    end
    context "データが保存されない" do
      it "名前なし" do
        @category.name = ""
        expect(@category).to be_invalid
        expect(@category.errors[:name]).to include("can't be blank")
      end
      it "フラグなし" do
        @category.flag = ""
        expect(@category).to be_invalid
        expect(@category.errors[:flag]).to include("can't be blank")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Productモデルとの関係' do
      it '1:Nとなっている' do
        expect(Category.reflect_on_association(:products).macro).to eq :has_many
      end
    end
  end
end
