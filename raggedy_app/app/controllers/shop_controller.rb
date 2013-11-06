class ShopController < ApplicationController
  def index
  	@products = Product.order('likes_count desc').unsold
  end
end
