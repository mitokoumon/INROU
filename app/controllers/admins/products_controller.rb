class Admins::ProductsController < ApplicationController
  def index
  	@product = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@categories = Category.all
  end

  def edit
  	@product = Product.find(params[:id])
  	@categories = Category.all
  end

  def create
  	@product = Product.new(product_params)
  	@product.save
  	redirect_to product_path(@product)
  end

  def update
  	@product = Product.find(params[:id])
  	@product.update(product_params)
  	redirect_to product_path(@product)
  end

  private
  def product_params
  	params.require(:product).permit(:category_id, :name, :text, :image, :now_price)
  end
end
