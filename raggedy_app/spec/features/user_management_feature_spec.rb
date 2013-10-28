require 'spec_helper'

def sign_in
	visit '/'
	click_link 'Login'
	fill_in 'Email', with: 'example@example.com'
	fill_in 'Password', with: 'changeme'
	click_button 'Sign in'
end

describe 'Sign up, logging in and out' do

	before do
		create(:user)
	end

	it 'new user can sign up' do 
		visit '/'
		click_link 'Register'
		fill_in 'Username', with: 'new_user'
		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'changeme'
		fill_in 'Password confirmation', with: 'changeme'
		click_button 'Sign up'

		expect(page).to have_content 'Welcome! You have signed up successfully'
	end 


	it 'can/t use existing username when singing up' do
	 	visit '/'
		click_link 'Register'
		fill_in 'Username', with: 'existing_user'
		fill_in 'Email', with: 'example@example.com'
		fill_in 'Password', with: 'changeme'
		fill_in 'Password confirmation', with: 'changeme'
		click_button 'Sign up'

		expect(page).to have_content 'Username has already been taken'

	end

	it 'can log in' do
		sign_in

		expect(page).to have_content 'Signed in successfully'
	end


	it 'when signed in can logout' do 
		sign_in

		click_link 'Logout'
		expect(page).to have_content 'Signed out successfully'
	end 




end

