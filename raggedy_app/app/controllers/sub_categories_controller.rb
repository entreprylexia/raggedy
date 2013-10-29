class SubCategoriesController < ApplicationController

	def index
	  	@products = Product.all
	  end

	def show
		@sub_category = SubCategory.find(params[:id])
		@products = @sub_category.products
	end
end
