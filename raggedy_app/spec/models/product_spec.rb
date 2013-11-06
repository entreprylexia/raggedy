require 'spec_helper'


describe Product do 

	context 'image' do 
		let(:product){FactoryGirl.create(:product, image: example_image)}

		it 'can have an attached product image' do 
			expect(product.image.exists?).to be_true
		end 

		it 'can have an thumbnail' do 
			expect(product.image.exists?(:thumb)).to be_true
		end
	end 



	it 'calculates a discount' do
		product = FactoryGirl.create(:product, original_price: 10, asking_price: 3)
		expect(product.discount).to eq "70%"
	end

	it "isn't sold if it has no orders" do 
		product = FactoryGirl.create(:product)
		expect(product).not_to be_sold
	end 

	it "is sold if it has an order" do 
		product = FactoryGirl.create(:product_with_orders)
		expect(product).to be_sold
	end

	it 'finds the right number of unsold items' do
		FactoryGirl.create(:product)
		expect(Product.unsold.count).to eq 1
	end

	
	it "unsold doesn't count sold items" do
		FactoryGirl.create(:product_with_orders)
		expect(Product.unsold.count).to eq 0
	end

end 

