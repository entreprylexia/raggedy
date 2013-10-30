require 'spec_helper'


describe Product do 


	it 'can have an attached product image' do 
		product = Product.create title: 'Foo', image: example_image
		expect(product.image.exists?).to be_true
	end 

	it 'can have an thumbnail' do 
		product = Product.create title: 'Foo', image: example_image
		expect(product.image.exists?(:thumb)).to be_true
	end

	it 'calculates a discount' do
		product = Product.create title: 'Foo',original_price: 10, asking_price: 3
		expect(product.discount).to eq "70%"
	end
end 

