class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery prepend: true, with: :exception
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。

	protected
	def after_sign_in_path_for(resource)
		# ログイン後の変遷画面
		# def after_sign_in_path_for(resource)
		if resource == current_user
    		@user = current_user
    		if @user.flag == 2
      			reset_session
				end
				root_path
		else
			top_admins_path
		end
	end

	# ログアウトと退会後の変遷
	# def after_sign_out_path_for(resource)
 #    	root_path
 # 	end

 	def after_sign_out_path_for(resource)
    if resource == :user
    	root_path
    elsif resource == :admin
      new_admin_session_path
    end
  end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :last_name, :family_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :flag])
		#sign_upの際にカラムへのデータ操作を許可。追加したカラムを記載。
	end
	# test
end
