class SizesController < ApplicationController
	def index
	  	@products = Product.all
	  end

	def show
		@size = Size.find(params[:id])
		@products = @size.products
	end
end
