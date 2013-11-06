require 'spec_helper'

describe 'buying items from myself' do

	let(:user) { FactoryGirl.create(:user) }
	let(:my_product) { FactoryGirl.create(:product, user: user) }
	before { login_as(user) }

	it 'should not show Add to Cart on my own product' do
		visit product_path(my_product)

		# raise page.html
		expect(page).not_to have_button 'Add to Cart'
	end
	
end