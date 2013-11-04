require 'spec_helper'

describe 'User adding category and sub category to items' do
	include_context "signed in"

	it 'adds category to product' do
		# FactoryGirl
		load "#{Rails.root}/db/seeds.rb"
		visit new_product_path
		# expect(body).to eq ""
		fill_in 'Title', with: 'My product'
		select 'Dresses', from: 'Category'
		click_button 'Create Product'

		expect(Product.last.sub_category.name).to eq 'Dresses'

	end 





end 