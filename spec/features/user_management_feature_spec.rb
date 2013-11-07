require 'spec_helper'



describe 'Sign up/in/out:' do

	it 'new user can sign up' do 
		create(:user)
		visit '/'
		click_link 'Sign Up'
		fill_in 'Username', with: 'new_user'
		fill_in 'Email', with: 'user@example.com'
		fill_in 'Password', with: 'changeme'
		fill_in 'Password confirmation', with: 'changeme'
		click_button 'Sign up'

		expect(page).to have_content 'Welcome! You have signed up successfully'
	end 


	it 'can/t use existing username when singing up' do
		create(:user)
	 	visit '/'
		click_link 'Sign Up'
		fill_in 'Username', with: 'existing_user'
		fill_in 'Email', with: 'example@example.com'
		fill_in 'Password', with: 'changeme'
		fill_in 'Password confirmation', with: 'changeme'
		click_button 'Sign up'

		expect(page).to have_content 'Username has already been taken'

	end

	describe "signed in" do
		include_context "signed in"

		it 'can log in' do
			expect(page).to have_content 'Signed in successfully'
		end

		it 'when signed in can logout' do 
			click_link 'Log Out'
			expect(page).to have_content 'Signed out successfully'
		end 
	end



end

