class ProductsController < ApplicationController
  def index
  	@products = Product.where(flag: 1)
  	@categories = Category.where(flag: 1)
  end

  def show
  	@product = Product.find(params[:id])
  	@categories = Category.where(flag: 1)
  	@cart = Cart.new
    if @product.category.flag == 2 || @product.flag == 2
      redirect_to products_path
    end
  end

  def judge
  	@category = Category.find(params[:id])
  	products = @category.products
    @products = products.where(flag: 1)
  	@categories = Category.where(flag: 1)
  	render :index
  end
end
