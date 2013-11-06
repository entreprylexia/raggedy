require 'spec_helper'

describe 'User uploading good' do

describe "signed in" do
		include_context "signed in"

	before do
		# user = FactoryGirl.create(:user)
		# login_as(user, :scope=>:user))
		load "#{Rails.root}/db/seeds.rb"
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


	it 'adds category to product' do
		visit new_product_path
		fill_in 'Title', with: 'My product'
		select 'Dresses', from: 'Category'
		click_button 'Create Product'

		expect(Product.last.sub_category.name).to eq 'Dresses'

	end 


	it 'can add size to a product' do
		visit new_product_path
		fill_in 'Title', with: 'My product'
		select 'Dresses', from: 'Category'
		select 'S', from: 'Size'
		click_button 'Create Product'

		expect(Product.last.sub_size.name).to eq 'S'
	end 

end 

end 







