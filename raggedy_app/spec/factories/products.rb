FactoryGirl.define do
	factory :product do
	    title "dress"
	    asking_price 10.0

		factory :product_with_orders do 
			after(:create) do |dress|
				Order.skip_callback(:create, :after, :send_confirmation_email)
				FactoryGirl.create_list(:order, 1, products: [dress])
			end 
	  	end 
	end
end

