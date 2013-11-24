Given(/^(Stephanie|Nina) wants to sell stuff on Raggedy$/) do |user|
  visit '/'
end

When(/^Stephanie signs up$/) do
  click_link 'Sign Up'
  fill_in 'Username', with: 'Stephanie'
  fill_in 'Email', with: 'stephanie@example.com'
  fill_in 'Password', with: 's3cr3tpwd'
  fill_in 'Password confirmation', with: 's3cr3tpwd'
  click_button 'Sign up'
end

Then(/^Stephanie should be able to sell items$/) do
  expect(page).to have_content 'You have signed up successfully.'
end

When(/^Nina signs up with a short password$/) do
  click_link 'Sign Up'
  fill_in 'Username', with: 'Stephanie'
  fill_in 'Email', with: 'stephanie@example.com'
  fill_in 'Password', with: 's3cr3t'
  fill_in 'Password confirmation', with: 's3cr3t'
  click_button 'Sign up'
end

Then(/^Nina should not be able to sign up$/) do
  expect(page).to have_content 'prohibited this user from being saved'
end

Given(/^Stephanie has signed up$/) do
  step %Q{Stephanie wants to sell stuff on Raggedy}
  step %Q{Stephanie signs up}
end

When(/^Nina wants to sign up using Stephanies details$/) do
	visit '/users/sign_out'
  step %Q{Nina wants to sell stuff on Raggedy}
  step %Q{Stephanie signs up}
end