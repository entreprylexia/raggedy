require 'spec_helper'

describe 'User uploading good' do

	before do
		user = FactoryGirl.create(:user)
		login_as(user)
	end
	
	it 'can click on Sales button to upload page' do
		visit '/'
		click_link 'Sell'
		visit new_product_path
		expect(page).to have_css 'h1', text: 'Add New Item'

	end 

	it 'can upload a product image' do 
		visit new_product_path
		fill_in 'Title', with: 'My product'
		attach_file 'Image', test_image_path
		click_button 'Create Product'

		expect(page).to have_css "img.product_image"
	end

end 