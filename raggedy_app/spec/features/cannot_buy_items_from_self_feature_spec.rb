require 'spec_helper'

describe 'buying items from myself' do

	let(:user) { FactoryGirl.create(:user) }
	let(:my_product) { FactoryGirl.create(:product, user: user) }
	before(:each) { login_as(user, :scope=>:user) }

	it 'should not show Add to Cart on my own product in product page' do
		visit product_path(my_product)
		# raise page.html
		expect(page).not_to have_button 'Add to Cart'
	end

	it 'should not show Add to Bag on my owwn product in the shop page' do 
		visit shop_path(my_product)

		expect(page).not_to have_button 'Add to Bag'
	end 
	
end