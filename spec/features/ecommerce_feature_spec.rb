require 'spec_helper'

describe 'Ecommerce Store' do 

	it 'should show the home page' do		
		visit('/products')
		expect(page).to have_content('EcommerceApp')
	end
 
 it 'should display at least one product' do
	visit('/products')
	product = Product.new(:name => 'iPhone').save
	expect(Product.last.name).to eq 'iPhone'
 end

end

describe 'the cart' do

	let(:iphone) {FactoryGirl.create(:product)}

	it 'should initiall be empty' do
		visit product_path(iphone)
		expect(page).to have_css '.item_count', text: '0 items'
	end
end