class ShopController < ApplicationController
  def index
  	@products = Product.all.order('likes_count desc')
  end
end
