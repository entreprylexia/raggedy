class CategoriesController < ApplicationController
	 def index
	  	@products = Product.all
	  end

	def show
		@category = Category.where('LOWER(name) = ?', params[:id]).first
		@products = @category.products
	end
end
