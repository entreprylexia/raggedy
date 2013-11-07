class ChargesController < ApplicationController

	layout 'application'
	
	def new
		@product = Product.find(params[:product_id])
	end

	def create
	  @product = Product.find(params[:product_id]) if params[:product_id]
	  # Amount in cents

	  if @product
		@amount = (@product.asking_price * 100).to_i
		@products = [@product]
	  else
	  	@amount = (current_cart.total * 100).to_i
	  	@products = current_cart.products
	  end

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  Order.create(user: current_user, products: @products)

	  current_cart.empty!

	  # current_cart.products.delete(@product)
	  # Empty your cart

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
