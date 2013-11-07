require 'spec_helper'

describe Cart do
  it 'should have a total' do 
  	p1 = FactoryGirl.create(:product, asking_price: 55)
  	p2 = FactoryGirl.create(:product, asking_price: 120)
  	cart = FactoryGirl.create(:cart, products: [p1,p2])

  	expect(cart.total).to eq 175.00
  end 
end
