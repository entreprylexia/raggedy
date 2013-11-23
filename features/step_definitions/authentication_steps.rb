

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end


Given /^I am not authenticated$/ do
	visit('/users/sign_out') 
end

Given /^I am a new, authenticated user$/ do 
	email = 'testing@man.net'
	passowrd = 'secretpass'
	User.new(:username => uname, :email => email, :password => password, :password_confirmation => password).save!

	
	visit 'users/sign_in'
	fill_in "user_email", :with => email
	fill_in "user_password", :with => password
	click_button "Login"

end 

