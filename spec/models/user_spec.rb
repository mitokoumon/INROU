require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build :user
    # factorybotで事前にユーザー情報を設定し持ってくる
  end
  describe "データが正しく保存される" do
    it "全て入力してあるので保存される" do
      expect(@user).to be_valid
      # @userが存在、valid(ある)のか
    end
  end
end
