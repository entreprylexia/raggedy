class ProfilesController < ApplicationController

	before_filter :check_user_matches_profile, only: [:edit, :update]

  def show
     @user = User.find_by_username(params[:id])
  end

  def create
  @user = User.create( params[:user] )
  end

  def edit
	end

	def update
		@user.update(params[:user].permit(:avatar))
		redirect_to profile_path(@user)
	rescue AWS::S3::Errors::RequestTimeout
		flash[:notice] = 'There was a problem connecting to S3'
		redirect_to profile_path(@user)
	end 

	private

	def check_user_matches_profile
  	@user = User.find_by_username(params[:id])
		raise "That's not you!" if current_user != @user
	end
end
