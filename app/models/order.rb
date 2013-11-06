class Order < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :products
	after_create :mark_sold
	after_create :send_confirmation_email

	def send_confirmation_email
		OrderNotifier.confirmation_email(products.count, user).deliver! 
		products.each do |product|
			seller =  product.user
			OrderNotifier.seller_confirmation_email(product, seller).deliver! 
		end
	end 
	
	def mark_sold
		products.each do |product|
			product.sold = true
			product.save
		end
	end 
	

end
