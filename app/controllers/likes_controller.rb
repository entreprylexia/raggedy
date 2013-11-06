class LikesController < ApplicationController

	def create
	  @product = Product.find(params[:product_id])
	  @like = current_user.like_product(@product)

	  if @like.new_record?
	  	current_user.likes << @like
	  else
	  	@like.delete
	  end
	  redirect_to :back
	end

end
