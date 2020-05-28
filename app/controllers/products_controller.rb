class ProductsController < ApplicationController
  def index
    @categories = Category.where(flag: 1)
    @total_number = 0
    products =[]
    @categories.each do |category|
      @total_number += category.products.count
      category.products.each do |product|
        products.append(product)
      end
    end
    @products = Kaminari.paginate_array(products).page(params[:page]).per(10)
  end

  def show
  	@product = Product.find(params[:id])
    @product_comment = ProductComment.new
  	@categories = Category.where(flag: 1)
  	@cart = Cart.new
    if @product.category.flag == 2
      redirect_to products_path
    end
  end

  def judge
    # カテゴリー検索で来た時用に別のコントローラーを用意してる
  	@category = Category.find(params[:id])
  	@products = @category.products.page(params[:page]).per(10).order(created_at: :desc)
  	@categories = Category.where(flag: 1)
    @total_number = @products.count
  	render :index
  end
end
