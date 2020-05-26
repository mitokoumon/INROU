class TopsController < ApplicationController
  def top
    @categories = Category.where(flag: 1)
    @recommended_products = Product.find(Bookmark.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
    # Bookmark.groupでproduct_idを持ったbookmarkをまとめて、.orderでproduct_idを持つbookmarkを降順に並べる、.limit(4)で上から４つ取得、.pluckでproduct_idのみを数字で取り出すように指定。
  end
  def about
  end
end
