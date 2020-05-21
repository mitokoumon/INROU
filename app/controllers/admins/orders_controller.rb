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
		order = Order.find(params[:id])
		order.update(orders_params)
		ordered_products = order.ordered_products
		if order.flag == 2
			ordered_products.update(flag: 2)
		end
			redirect_to request.referer
	end

	private
	def orders_params
		params.require(:order).permit(:flag)
	end

end
