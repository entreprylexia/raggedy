class ProductsController < ApplicationController

	before_filter :authenticate_user!, only: [:new]

  def new
  	@product = Product.new
    @categories = Category.all
  end

  def create
  	@product = Product.new(params[:product].permit(:title, :text, :image, :sub_category_id))

  	if @product.save
       redirect_to @product
    else 
   	  render 'new'
   end

  rescue AWS::S3::Errors::RequestTimeout
    flash.now[:notice] = "Upload time out"
    render 'new'
  end


  def index
  @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  @product = Product.find(params[:id])
  end

  def update
  @product = Product.find(params[:id])
 
  if @product.update(params[:product].permit(:title, :text, :image))
    redirect_to @product
  else
    render 'edit'
  end
end

def destroy
  @product = Product.find(params[:id])
  @product.destroy
 
  redirect_to products_path
end

 protect_from_forgery with: :exception
  before_filter :create_empty_cart
  helper_method :current_cart

  def create_empty_cart
    session[:cart_id] ||= Cart.create.id
  end

  def current_cart
    Cart.find session[:cart_id]
  end



private

  def product_params
    params.require(:post).permit(:title, :text)

  end


end