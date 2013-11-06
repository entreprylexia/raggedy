class ShopController < ApplicationController
  def index
  	@products = Product.all.order('likes_count desc')
  	if params[:max_price]
	  	@products = @products.where('asking_price < ?', params[:max_price])
	end
  end
end
