require 'spec_helper'

describe 'Order confirmation' do 

	let(:user) { FactoryGirl.create(:user) }
	let(:seller) { FactoryGirl.create(:user, username: 'seller', email: 'seller@gmail.com') }
	let(:product) { FactoryGirl.create(:product, user: seller) }

	def create_order
		Order.create(user: user, products: [product])
	end

	it 'should be send after order' do 
		expect{ create_order }.to change {emails.count}.by 2
	end

	describe 'Buyer confirmation' do

		it 'should have the subject "Order confirmation"' do 
			create_order
			buyer_confirmation = emails.last(2).first

			expect(buyer_confirmation.subject).to eq "Order Confirmation"
		end 

		it 'should name the number of items' do 
			create_order
			buyer_confirmation = emails.last(2).first

			expect(buyer_confirmation.body).to match /1 item/
		end 

	end

	describe 'Seller confirmation' do

		it 'should be sent to the seller' do 
			create_order
			seller_confirmation = emails.last

			expect(seller_confirmation.to.first).to eq "seller@gmail.com"
		end 

		it 'should have the subject "Item Sold"' do 
			create_order
			seller_confirmation = emails.last

			expect(seller_confirmation.subject).to eq "Item Sold"
		end 

		it 'should have the name of the product which was sold' do 
			create_order
			seller_confirmation = emails.last

			expect(seller_confirmation.body).to match /dress/
		end 


	end

end 





