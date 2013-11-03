require 'spec_helper'

describe 'order confirmation' do 

	it 'should be send after order' do 
		expect{ Order.create(number_of_items: 3)}.to change {emails.count}.by 1
	end 


	it 'should have the subject "Order confirmation"' do 
		Order.create(number_of_items: 3)
		expect(emails.last.subject).to eq "Order Confirmation"
	end 

	it 'should name the number of items' do 
		Order.create(number_of_items: 3)
		expect(emails.last.body).to match /3 items/
	end 

end 

