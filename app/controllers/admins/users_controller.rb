class Admins::UsersController < ApplicationController
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
		@users = User.search(params[:search])
		@products = Product.search(params[:search])
	end

	private
	def user_params
		params.require(:user).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :flag)
	end


end
