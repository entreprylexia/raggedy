class SubSizesController < ApplicationController

	def index
	  	@products = Product.all
	  end

	def show
		@sub_size = SubSize.find(params[:id])
		@products = @sub_size.products
	end
end
