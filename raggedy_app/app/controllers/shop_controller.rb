class ShopController < ApplicationController
  def index
  	@products = Product.order('likes_count desc').unsold
  	if params[:max_price]
	  	@products = @products.where('asking_price < ?', params[:max_price])
	end
  end
end
