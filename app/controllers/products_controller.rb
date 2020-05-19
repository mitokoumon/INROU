class ProductsController < ApplicationController
  def index
  	@categories = Category.where(flag: 1)
    @products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  	@categories = Category.where(flag: 1)
  	@cart = Cart.new
    if @product.category.flag == 2
      redirect_to products_path
    end
  end

  def judge
  	@category = Category.find(params[:id])
  	@products = @category.products
  	@categories = Category.where(flag: 1)
  	render :index
  end
end
