class CartsController < ApplicationController
  def index
    @carts = Cart.all
    @cart = current_user.carts
    @total_price = 0
    @carts.each do |cart|
      @total_price += cart.product.now_price * cart.number
    end
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
    redirect_to products_path
  end


  private
    def cart_params
      params.require(:cart).permit(:number)
    end
end
