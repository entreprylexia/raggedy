require 'spec_helper'

describe 'Product listing Page' do 

	def sign_in
		visit '/'
		click_link 'Login'
		fill_in 'Email', with: 'example@example.com'
		fill_in 'Password', with: 'changeme'
		click_button 'Sign in'
	end

	let!(:user) { FactoryGirl.create(:user) }
	let(:product) { FactoryGirl.create(:product, :user=>user) }
	before(:each) do
		sign_in
	end

	 it ' If user is the creator of the product, he can dstroy the item' do 
	   visit product_path(product)
	   expect{click_link 'Destroy'}.to change {Product.count}.by -1
	end 



end 