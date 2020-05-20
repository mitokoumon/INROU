class Admins::OrderedProductsController < ApplicationController
    before_action :authenticate_admin!
	def create
		@ordered_product = OrderedProduct.new(ordered_products_params)
		@ordered_product.save
	end

	def update
		ordered_product = OrderedProduct.find_by(order_id: order.id)
		ordered_product.update
	end

	private
	def ordered_products_params
		params.require(:ordered_product).permit(:number, :flag, :price)
	end

end