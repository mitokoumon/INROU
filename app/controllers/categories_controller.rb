class CategoriesController < ApplicationController
	before_action :authenticate_admin!
	def index
		@category = Category.new
		@categories = Category.all
	end

	def create
	end

	def edit
	end

	def update
	end



	private
	def category_params
		params.require(:category).permit(:name, :flag)
	end
end
