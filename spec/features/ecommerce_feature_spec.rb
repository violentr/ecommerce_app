require 'spec_helper'

describe 'Ecommerce Store' do 

	it 'should show the home page' do		
		visit('/products')
		expect(page).to have_content('Product List')
	end
 
 it 'should display at least one product' do
	visit('/products')
	product = Product.new(:name => 'iPhone').save
	expect(Product.last.name).to eq 'iPhone'
 end


end