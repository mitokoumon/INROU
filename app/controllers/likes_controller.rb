class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    product = Product.find(params[:product_id])
    like = current_user.likes.new(product_id: product.id)
    like.save
    redirect_to request.referer
  end

  def index
  end

  def destroy
    product = Product.find(params[:product_id])
    like = current_user.likes.new(product_id: product.id)
    like.destroy
    redirect_to request.referer
  end
end
