class Admins::OrderedProductsController < ApplicationController
    before_action :authenticate_admin!
#OrderedProductsControllerのようにordered_products_controllerから大文字に直す必要がある
	def create
		@ordered_product = OrderedProduct.new(ordered_products_params)
		@ordered_product.save
		redirect_to request.referer
	end

	def update
		ordered_product = OrderedProduct.find(params[:id])
		ordered_product.update(ordered_products_params)
		order = ordered_product.order
		ordered_products_flag = OrderedProduct.where(order_id: order.id,flag: 4)
		ordered_products = OrderedProduct.where(order_id: order.id)

		if ordered_product.flag == 3
			order.update(flag: 3)
  			redirect_to request.referer
		elsif ordered_products_flag.count == ordered_products.count#flag=4の注文商品数とflag=?な注文商品数の要素数が一致するということは全てflag=4になったということを示している
			order.update(flag: 4)
			redirect_to request.referer
		else
	  		redirect_to request.referer
	  end
		# 前のページに遷移
	end

	private
	def ordered_products_params
		params.require(:ordered_product).permit(:number, :flag, :price)
	end

end
