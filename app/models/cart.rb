class Cart < ActiveRecord::Base
	has_and_belongs_to_many :products


	def count
		products.count
	end

	def total
		products.sum(:price)
		# products.inject(0) {|sum, product| sum + product.price }
	end
end
