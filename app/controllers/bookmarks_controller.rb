class BookmarksController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    bookmark = current_user.bookmarks.new(product_id: @product.id)
    bookmark.save
    #非同期通信を実装しているため、リダイレクト先は記述しない。
    #リダイレクト先を記述しなければ、自動的に同名viewフォルダのアクションと同じ名前のjsファイルを検索する。
  end

  def destroy
    @product = Product.find(params[:product_id])
    bookmark = current_user.bookmarks.find_by(product_id: @product.id)
    bookmark.destroy
    #非同期通信を実装しているため、リダイレクト先は記述しない。
    #リダイレクト先を記述しなければ、自動的に同名viewフォルダのアクションと同じ名前のjsファイルを検索する。
  end

end
