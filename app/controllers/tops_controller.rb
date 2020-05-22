class TopsController < ApplicationController
  def top
    @user = current_user
    @categories =Category.all
    @products =Product.all
  end
  def about
  end
end
