require 'spec_helper'

describe 'the cart' do 
	let(:dress) {FactoryGirl.create(:product)}
	let(:user) { FactoryGirl.create(:user)}
	before(:each) { login_as(user, scope: :user) }

	it 'should initally be empty' do 
		visit shop_path(dress)
		expect(page).to have_css '.item_count', text: '0 item'
	end 

	it 'can have items to it' do 
		visit shop_path(dress)
		click_button "Add to Bag" 
		expect(page).to have_css '.item_count', text: '1 item'
	end 

	it 'can remove an item' do 
		visit shop_path(dress)
		click_button "Add to Bag"
		click_link '1 item'
		click_link "Remove"
		expect(page).to have_css '.item_count', text: '0 item'
	end 

end 