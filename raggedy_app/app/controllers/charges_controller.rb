class ChargesController < ApplicationController

	def new
		@product = Product.find(params[:product_id])
	end

	def create
	  @product = Product.find(params[:product_id])
	  # Amount in cents
	  @amount = (@product.asking_price * 100).to_i

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

	  Order.create(user: current_user, products: [@product])

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end

end
