require 'spec_helper'

describe Product do

  it 'should have a price' do
  	product=Product.create(price: 230.99)
  	expect(product.price).to eq 230.99
	end

	it 'should have a description' do
		product =Product.create(description:'something here')
  	expect(product.description).to eq 'something here'
	end	

	it 'should have a description with price ' do
		product =Product.create(description:'something here', price: 8)
  	expect(product).not_to be_missing_details
	end
end
