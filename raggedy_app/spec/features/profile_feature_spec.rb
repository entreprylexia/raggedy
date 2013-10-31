require 'spec_helper'

describe 'user profile page' do 

	it 'can upload an image' do 
		visit user_path "yuin"

		attach_file 'Image', test_image_path
		click_button 'Create Image'

		expect(page).to have_css "img.profile_image"

	end 


end 