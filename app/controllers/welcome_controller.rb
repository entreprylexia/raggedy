class WelcomeController < ApplicationController
  def index
  	redirect_to '/shop' if user_signed_in?
  end
end
