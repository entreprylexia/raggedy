class SubCategoriesController < ApplicationController

	def index
	  	@products = Product.all
	  end

	def show
		@sub_category = SubCategory.where('LOWER(name) = ?', params[:id]).first
		@products = @sub_category.products
		# @products = @products.where(size: params[:size]) if params[:size]
	end
end
