When(/^Stephanie adds a bag to sell$/) do
  click_link '+ Sell'
  fill_in 'Title', with: 'Bag'
  select 'Shoulder Bags', from: 'Category'
  select 'One Size', from: 'Size'
  fill_in 'Original price', with: '77'
  fill_in 'Asking price', with: '33'
  fill_in 'Leave a note', with: 'I really love this bag!'
  click_button 'Create Product'
end

Given(/^Stephanie adds a dress to sell$/) do
  click_link '+ Sell'
  fill_in 'Title', with: 'New Dress'
  select 'Dresses', from: 'Category'
  select 'M', from: 'Size'
  fill_in 'Original price', with: '77'
  fill_in 'Asking price', with: '33'
  fill_in 'Leave a note', with: 'I really love this dress!'
  click_button 'Create Product'
end

When(/^Stephanie adds a bag to sell with an original price of (\d+)$/) do |price|
  click_link '+ Sell'
  fill_in 'Title', with: 'Bag'
  select 'Shoulder Bags', from: 'Category'
  select 'One Size', from: 'Size'
  fill_in 'Original price', with: price
  fill_in 'Asking price', with: '33'
  fill_in 'Leave a note', with: 'I really love this bag!'
  click_button 'Create Product' # express the regexp above with the code you wish you had
end


Then(/^the bag should have been added to the shop$/) do
  expect(Product.last.title).to eq 'Bag'
end

When(/^she decides to change the Title to "(.*?)"$/) do |title|
  click_link 'Edit'
  fill_in 'Title', with: "Chanel Bag 22"
  click_button 'Update Product'
end

Then(/^the Title should have changed to "(.*?)"$/) do |title|
  expect(page).to have_content "#{title}"
end



When(/^she decides to change the Category from "(.*?)" to "(.*?)"$/) do |label, category|
  click_link 'Edit'
  select 'Dresses', from: 'Category' 
  click_button 'Update Product'
end

Then(/^the Category should have changed to "(.*?)"$/) do |category|
  expect(Product.last.sub_category.name).to eq 'Dresses' 
end

When(/^she decides to change the dress size to "(.*?)"$/) do |size|
  click_link 'Edit'
  select 'S', from: 'Size' 
  click_button 'Update Product'
end

Then(/^the Size should have changed to "(.*?)"$/) do |size|
  expect(Product.last.sub_size.name).to eq 'S'
end

When(/^she decides to change the Description to "(.*?)"$/) do |description|
  click_link 'Edit'
  fill_in 'Leave a note', with: "Brand New"
  click_button 'Update Product'
end

Then(/^the Description should have changed to "(.*?)"$/) do |description|
  expect(page).to have_content "#{description}"
end

When(/^she decides to change the "(.*?)" to "(.*?)"$/) do |field, price|
  click_link 'Edit'
  fill_in field, with: price
  click_button 'Update Product'
end

Then(/^the (Asking|Original) price should have changed to "(.*?)"$/) do |field, price|
  expect(page).to have_content "£#{price}"
end

When(/^Stephanie adds a bag to sell with prices in usd$/) do
  click_link '+ Sell'
  fill_in 'Title', with: 'Bag'
  select 'Shoulder Bags', from: 'Category'
  select 'One Size', from: 'Size'
  fill_in 'Original price', with: '$77'
  fill_in 'Asking price', with: '$33'
  fill_in 'Leave a note', with: 'I really love this bag!'
  click_button 'Create Product'
end

Then(/^there will be an error while trying to add the bag$/) do
  expect(page).to have_content 'prohibited this product from being saved'
end