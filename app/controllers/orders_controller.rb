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

  def check
	@order = Order.new
  # newから持ってきた情報をcheckに送るためにインスタンス変数として情報を入れ込んでます
	@order.ordered_products.build
  # orderとordered_productに同時に保存する際に必要
	@payment = params[:payment]
  # new画面のpaymentのデータを取り出す
	zyusyo = params[:zyusyo]
  # new画面のzyusyo(ラジオボタンの番号)のデータを取り出す
	@total_price = 0
	current_user.carts.each do |cart|
		@total_price += cart.product.now_price * cart.number * 1.1
	end
  	if zyusyo == "1"
  		@aaa = current_user.address_all
      # user.rbに定義したメソッド(address_all)を使用
  		@ddd = current_user.address
  		@bbb = current_user.post_code
  		@ccc = current_user.family_name+current_user.last_name
  	elsif zyusyo == "2"
  		reciever_id = params[:zyusyo2]
  		receiver = Receiver.find(reciever_id)
  		@aaa = receiver.address_all
      # receiver.rbに定義したメソッド(address_all)を使用
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
    # 選んだラジオボタンによってユーザーの住所、登録配送先、入力した住所を取り出せるようにする
  end

  def thanks
  end

  def create
  	@order = Order.new(order_params)
  	if @order.save
    	carts = current_user.carts
    	carts.destroy_all
    	redirect_to order_thanks_users_path
    else
      render "new"
    end
  end

  private
  def order_params
    params.require(:order).permit(:user_id,:post_code, :address, :name, :total_price, :shipping_fee, :payment, :flag, ordered_products_attributes:[:id, :product_id, :number, :flag, :price])
  # orderを作った時にordered_productsを作るための方法、modelにも定義が必要
  end
  # order.rbへaccepts_nested_attributes_for :ordered_products　、ordered_products_attributes:[:id, :product_id, :number, :flag, :price]することでordered_productのparamsとして
  # 取得できるようにする。
end
