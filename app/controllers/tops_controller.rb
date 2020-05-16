class TopsController < ApplicationController
  def top
    @categories =Category.all
    @products =Product.all
  end
  def about
  end
end
