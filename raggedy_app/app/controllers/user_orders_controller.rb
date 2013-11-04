class UserOrdersController < ApplicationController

	before_filter :check_user_matches_profile

  def show
     @user = User.find_by_username(params[:id])
  end

  private

	def check_user_matches_profile
  	@user = User.find_by_username(params[:id])
		raise "That's not you!" if current_user != @user
	end

end
