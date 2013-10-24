require 'spec_helper'

describe Product do

  it 'should have a price' do
  	product=Product.create(price: 230.99)
  	expect(product.missing_details?).to be_true
	end

	it 'should have a description' do
		product =Product.create(description:'something here')
  	expect(product).to be_missing_details
	end	

	it 'should have a description OR price ' do
		product =Product.create(description:'something here', price: 8)
  	expect(product).not_to be_missing_details
	end
end
