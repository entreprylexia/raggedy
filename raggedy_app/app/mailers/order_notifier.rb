class OrderNotifier < ActionMailer::Base
  default from: "no-reply@example.com"

  def confirmation_email(number_of_items, buyer)
  	@number_of_items = number_of_items
  	@buyer = buyer

  	mail(to: buyer.email, subject: 'Order Confirmation')
  end 
  
end
