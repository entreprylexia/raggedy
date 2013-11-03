class Order < ActiveRecord::Base

	after_create :send_confirmation_email

	def send_confirmation_email
		OrderNotifier.confirmation_email(number_of_items).deliver! 
	end 


end
