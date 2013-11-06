require 'spec_helper'

describe 'user profile page' do 

	def sign_in
		visit '/'
		click_link 'Login'
		fill_in 'Email', with: 'example@example.com'
		fill_in 'Password', with: 'changeme'
		click_button 'Sign in'
	end

	let!(:user) { FactoryGirl.create(:user) }
	before(:each) do
		load "#{Rails.root}/db/seeds.rb"
		sign_in
	end

	it 'can visit a profile page' do 
		visit profile_path(user)
		expect(page).to have_content "existing_user's Profile"
	end 

	it 'can add a profile picture' do 
		visit edit_user_registration_path(user)
		attach_file 'Image', test_image_path
		fill_in 'Current password', with: 'changeme'
		click_button 'Update'

		expect(page).to have_css "img.profile_image"
	end 

	it 'has currect user products under my closet' do
		visit new_product_path
		fill_in 'Title', with: 'My product'
		select 'Dresses', from: 'Category'
		select 'S', from: 'Size'
		click_button 'Create Product'
		visit profile_path(user)


		expect(page).to have_content 'My product'

	end 



end 