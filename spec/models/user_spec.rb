require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = create :user
      # factorybotで事前にユーザー情報を設定し持ってくる
    end
    context "データが正しく保存される" do
      it "全て入力してあるので保存される" do
        expect(@user).to be_valid
        # @userが存在、valid(ある)のか
      end
    end
    context "データが保存されない" do
      it "名字なし" do
        @user.family_name = ""
        expect(@user).to be_invalid
        expect(@user.errors[:family_name]).to include("can't be blank")
      end
      it "名前なし" do
        @user.last_name = ""
        expect(@user).to be_invalid
        expect(@user.errors[:last_name]).to include("can't be blank")
      end
      it "名字カナなし" do
        @user.family_name_kana = ""
        expect(@user).to be_invalid
        expect(@user.errors[:family_name_kana]).to include("can't be blank")
      end
      it "名前カナなし" do
        @user.last_name_kana = ""
        expect(@user).to be_invalid
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end
      it "郵便番号6文字" do
        @user.post_code = "123456"
        expect(@user).to be_invalid
        expect(@user.errors[:post_code]).to include("is the wrong length (should be 7 characters)")
      end
      it "電話番号なし" do
        @user.telephone_number = ""
        expect(@user).to be_invalid
        expect(@user.errors[:telephone_number]).to include("can't be blank")
      end
      it "住所なし" do
        @user.address = ""
        expect(@user).to be_invalid
        expect(@user.errors[:address]).to include("can't be blank")
      end
      it "パスワードなし" do
        @user.password = ""
        expect(@user).to be_invalid
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it "メールなし" do
        @user.email = ""
        expect(@user).to be_invalid
        expect(@user.errors[:email]).to include("can't be blank")
      end
      it "同じメールは登録できない" do
        @user1 = build(:user, last_name: "jimen")
        expect(@user1).to be_invalid
        expect(@user1.errors[:email]).to include("has already been taken")
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'receiverモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:receivers).macro).to eq :has_many
      end
    end
    context 'orderモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
    context 'cartモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:carts).macro).to eq :has_many
      end
    end
    context 'product_commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:product_comments).macro).to eq :has_many
      end
    end
    context 'bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
    context 'bookmark_productモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:bookmark_products).macro).to eq :has_many
      end
    end
  end
end
