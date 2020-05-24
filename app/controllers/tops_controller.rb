class TopsController < ApplicationController
  def top
    @categories = Category.where(flag: 1)
    @products = Product.page(params[:page]).per(4).order(created_at: :desc)
  end
  def about
  end
end
