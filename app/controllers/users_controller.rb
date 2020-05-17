class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(current_user.id)
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		@user.update(user_params)
		if @user.flag == 1 then
	  		redirect_to users_path
		elsif @user.flag == 2
			reset_session
      			redirect_to root_path
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
