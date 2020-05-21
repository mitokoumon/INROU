class OrdersController < ApplicationController
  def index
  	@orders = current_user.orders
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
  end

  def check
	@order = Order.new
	@order.ordered_products.build
	@payment = params[:payment]
	zyusyo = params[:zyusyo]
	@total_price = 0
	current_user.carts.each do |cart|
		@total_price += cart.product.now_price * cart.number * 1.1
	end
  	if zyusyo == "1"
  		@aaa = current_user.address_all
  		@ddd = current_user.address
  		@bbb = current_user.post_code
  		@ccc = current_user.family_name+current_user.last_name
  	elsif zyusyo == "2"
  		reciever_id = params[:zyusyo2]
  		receiver = Receiver.find(reciever_id)
  		@aaa = receiver.address_all
  		@ddd = receiver.address
  		@bbb = receiver.post_code
  		@ccc = receiver.name
  	elsif zyusyo == "3"
  		@aaa = params[:address] +params[:post_code] +params[:name]
  		@ddd = params[:address]
  		@bbb = params[:post_code]
  		@ccc = params[:name]
  	else
  	end
  end

  def thanks
  end

  def create
  	@order = Order.new(order_params)
  	@order.save
  	carts = current_user.carts
  	carts.destroy_all
  	redirect_to order_thanks_users_path
  end

  private
  def order_params
    params.require(:order).permit(:user_id,:post_code, :address, :name, :total_price, :shipping_fee, :payment, :flag, ordered_products_attributes:[:id, :product_id, :number, :flag, :price])
  end
end
