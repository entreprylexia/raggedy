class CartsController < ApplicationController

	def update
	    product = Product.find params[:cart][:product_id]
	    current_cart.products << product

	    redirect_to product_path(product)
 	end

	def destroy
		@product = Product.find(params[:id])
		current_cart.products.delete(@product)
		redirect_to
		# redirect_to products_path
	end
end
