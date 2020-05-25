class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.page(params[:user_page]).per(10)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admins_user_path(@user.id)
		else
			render "edit"
		end
	end

	def search
		split_keyword = params[:search].split(/[[:blank:]]+/)
		# 検索窓に入力した文字列を空白で分割する
	  users = []
	  products = []
	  # 各キーワードで調べた結果を入れるための箱を作る
	  split_keyword.each do |keyword|
	    next if keyword == ""
	    users += User.where('family_name LIKE ?', "%#{keyword}%").or(User.where(['last_name LIKE ?', "%#{keyword}%"])).or(User.where(['family_name_kana LIKE ?', "%#{keyword}%"])).or(User.where(['last_name_kana LIKE ?', "%#{keyword}%"]))
	    products += Product.where('name LIKE ?', "%#{keyword}%")
	  end
	  # 各キーワード毎に検索して、[]に入れる
	  users.uniq!
	  products.uniq!
	  # []の中で重複した情報を削除する
		# @users = User.search(params[:search])
		# @products = Product.search(params[:search])
		user1 = []
		product1 = []
		users.each do |user|
			user1.append(user)
		end
		products.each do |product|
			if product.category.flag == 1
				product1.append(product)
			end
		end
		@users = Kaminari.paginate_array(user1).page(params[:user_page]).per(5)
		@products = Kaminari.paginate_array(product1).page(params[:product_page]).per(5)
	end

	private
	def user_params
		params.require(:user).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :flag)
	end


end
