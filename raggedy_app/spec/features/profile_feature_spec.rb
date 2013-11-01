require 'spec_helper'

describe 'user profile page' do 

	let(:user) { FactoryGirl.create(:user) }

	it 'can visit a profile page' do 
		visit profile_path(user)
		expect(page).to have_content 'Profile page'
	end 


end 