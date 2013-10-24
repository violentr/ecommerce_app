class OrderNotifier < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(number_of_items)
  	@number_of_items =number_of_items
	mail(to: 'someuser@example.com',subject: 'Order Confirmation')
  end
end
