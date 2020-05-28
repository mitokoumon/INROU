class OrdersController < ApplicationController
  def index
  	@orders = current_user.orders.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  	@order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create_test
    address_select = params[:address_s].to_i
    session[:payment] = params[:payment].to_i
    # binding.pry
    if address_select == 1
      session[:input] = {"postcode": current_user.post_code, "address": current_user.address, "name": current_user.family_name+current_user.last_name }
    elsif address_select == 2
      receiver = Receiver.find(params[:id])
      session[:input] = {"postcode": receiver.post_code, "address": receiver.address, "name": receiver.name }
    elsif address_select == 3
      session[:input] = {"postcode": params[:post_code], "address": params[:address], "name": params[:name] }
    end
    redirect_to order_check_users_path
  end

  def check
  	@order = Order.new
    # newから持ってきた情報をcheckに送るためにインスタンス変数として情報を入れ込んでます
  	# @order.ordered_products.build
    # orderとordered_productに同時に保存する際に必要
  	@total_price = 0
  	current_user.carts.each do |cart|
  		@total_price += cart.product.now_price * cart.number * 1.1
  	end
  end

  def thanks
  end

  def create
  	@order = Order.new(order_params)
    ordered_product = @order.ordered_products.new
    current_user.carts.each do |cart|
      ordered_product.product_id = cart.product.id
      ordered_product.number = cart.number
      ordered_product.price = cart.product.now_price
      ordered_product.flag = 1
    end
    ordered_product.save
  	if @order.save
    	carts = current_user.carts
    	carts.destroy_all
      session[:payment]= nil
      session[:input] =nil
    	redirect_to order_thanks_users_path
    else
      render "new"
    end
  end

  private
  def order_params
    params.require(:order).permit(:address_s,:user_id,:post_code, :address, :name, :total_price, :shipping_fee, :payment, :flag)
  # orderを作った時にordered_productsを作るための方法、modelにも定義が必要
  end

  # order.rbへaccepts_nested_attributes_for :ordered_products　、ordered_products_attributes:[:id, :product_id, :number, :flag, :price]することでordered_productのparamsとして
  # 取得できるようにする。
end
