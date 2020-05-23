class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!,except:[:index]
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.where(flag: 1)
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.where(flag: 1)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
       redirect_to admins_product_path(@product)
    else
      @product = Product.new
      @categories = Category.where(flag: 1)
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
     redirect_to admins_product_path(@product)
    else
      @product = Product.find(params[:id])
      @categories = Category.where(flag: 1)
      render "edit"
    end
  end

  private
  def product_params
    params.require(:product).permit(:category_id, :name, :text, :image, :now_price, :flag)
  end
end