class Admins::OrdersController < ApplicationController
	before_action :authenticate_admin!
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@ordered_products = @order.ordered_products
	end

	def update
		@order = Order.find(params[:id])
		@order.update(orders_params)
	end

	private
	def orders_params
		params.require(:order).permit(:flag)
	end

end