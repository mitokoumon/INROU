class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.page(params[:page]).per(10)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to admins_user_path(@user.id)
	end

	def search
		split_keyword = params[:search].split(/[[:blank:]]+/)
	  @users = []
	  @products = []
	  split_keyword.each do |keyword|
	    next if keyword == ""
	    @users += User.where('family_name LIKE ?', "%#{keyword}%").or(User.where(['last_name LIKE ?', "%#{keyword}%"])).or(User.where(['family_name_kana LIKE ?', "%#{keyword}%"])).or(User.where(['last_name_kana LIKE ?', "%#{keyword}%"]))
	    @products += Product.where('name LIKE ?', "%#{keyword}%")
	  end
	  @users.uniq!
	  @products.uniq!
		# @users = User.search(params[:search])
		# @products = Product.search(params[:search])
	end

	private
	def user_params
		params.require(:user).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :flag)
	end


end
