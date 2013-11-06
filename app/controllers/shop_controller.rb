class ShopController < ApplicationController
  def index
  	@products = Product.all.order('likes_count desc').unsold
  	@products = @products.cheaper_than(params[:max_price]) if params[:max_price]
  	@products = @products.more_expensive_than(params[:min_price]) if params[:min_price]
  end
end
