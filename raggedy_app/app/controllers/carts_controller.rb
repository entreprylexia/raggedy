class CartsController < ApplicationController
	def update
    product = Product.find params[:cart][:product_id]
    current_cart.products << product

    redirect_to product_path(product)
  end
end
