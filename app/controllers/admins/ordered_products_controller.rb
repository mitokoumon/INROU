class Admins::OrderedProductsController < ApplicationController
    before_action :authenticate_admin!
	def create
		@ordered_product = OrderedProduct.new(ordered_products_params)
		@ordered_product.save
		redirect_to request.referer
	end

	def update
		ordered_products = OrderedProduct.find(params[:id])
		ordered_products.update(ordered_products_params)
		redirect_to request.referer
		# 前のページに遷移
	end

	private
	def ordered_products_params
		params.require(:ordered_product).permit(:number, :flag, :price)
	end

end