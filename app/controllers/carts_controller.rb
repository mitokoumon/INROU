class CartsController < ApplicationController
  def index
    @carts = Cart.all
    @cart = current_user.carts
    @total_price = 0
    @carts.each do |cart|
      @total_price += cart.product.now_price * cart.number
    end
  # total_price=0で変数の初期値を0と設定する
  # eachで取り出した各カートの小計(cart.product.now_price * cart.number)を
  # total_priceに足し算を行うことで合計金額を出す
  end

  def create
    @product = Product.find(params[:id])
    cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
    @cart = Cart.new(cart_params)
    if cart.present?
      total_number = 0
      total_number = cart.number + @cart.number
      cart.update(number: total_number)
    else
      @cart.product_id = @product.id
      @cart.user_id = current_user.id
      @cart.save
    end
    # Cart.find_by(product_id: @product.id, user_id: current_user.id)で既に
    # カレントユーザーが同じ商品をカートに入れているのか調べる
    # if文で同一カートが存在した場合は既存のカートに個数を足し、存在しない場合はカートを
    # 作成する
    redirect_to users_carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to users_carts_path
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to users_carts_path
  end

  def destroy_all
    @carts = current_user.carts
    @carts.destroy_all
    # destroyでは一つのレコードしか消せないので、destroy_allを使用
    redirect_to products_path
  end


  private
    def cart_params
      params.require(:cart).permit(:number)
    end
end
