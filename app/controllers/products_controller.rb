class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@categories = Category.all
  end

  def show
  	@product = Product.find(params[:id])
  	@categories = Category.all
  	@cart = Cart.new
  end

  def judge
  	category = Category.find(params[:id])
  	@products = category.products
  	@categories = Category.all
  	render :index
  end
end
