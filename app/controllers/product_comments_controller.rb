class ProductCommentsController < ApplicationController

    def create
    	comment = current_user.product_comments.new(product_comment_params)
    	#product = Product.find_by(id: comment.product_id)
    	#comment.product_id = product.id
    	user_comment = ProductComment.find_by(user_id: current_user.id, product_id: comment.product_id)
	    if user_comment.present?
	      user_comment.update(title: comment.title, comment: comment.comment, rate: comment.rate)
	    else
			comment.save
	    end
	    redirect_back(fallback_location: root_path)
	end

	def destroy
		comment = ProductComment.find(params[:id])
  		comment.destroy
  		redirect_back(fallback_location: root_path)
    end

	private
	def product_comment_params
    	params.require(:product_comment).permit(:comment, :user_id, :product_id, :title, :rate)
	end

end
