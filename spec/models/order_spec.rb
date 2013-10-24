
require 'spec_helper'
describe 'an order confirmation email' do
	it 'is sent when order is created' do
		expect{Order.create(number_of_items: 3)}.to change {emails.count}.by(1)

	# 	old_email_count =emals.count
	# 	Order.create
	# 	expect(emails.count).to eq old_email_count+1
	end
	it 'should have subject "Order confirmation"' do
		Order.create(:number_of_items => 3)
		expect(emails.last.subject).to eq 'Order Confirmation'
	end
	it 'should include the number of items ordered' do
		Order.create(:number_of_items => 3)
		expect(emails.last.body).to match /3 items/
	end
end

def emails
	ActionMailer::Base.deliveries
end
