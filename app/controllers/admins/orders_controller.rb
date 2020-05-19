class Admins::TopsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@odered_products = @order.products
	end

	def flag_update
		@order = Order.find(params[:id])
		@order.update(orders_params)
	end

	private
	def orders_params
		params.require(:orders).permit(:flag)
	end

end