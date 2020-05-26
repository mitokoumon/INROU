class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(current_user.id)
		@products = @user.bookmark_products
		# ユーザーがブックマークした商品を代入する。bookmark_productsはuser.rbでアソシエーションしたもの。
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
			if @user.flag == 1 then
		  		redirect_to users_path
			elsif @user.flag == 2
				reset_session
				# userを強制的にログアウトする
	      			redirect_to root_path
			end
		else
			render "edit"
		end
	end

	def flag
		@user = User.find(current_user.id)
	end

	private
	def user_params
		params.require(:user).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :flag)
	end


end
