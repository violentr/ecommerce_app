class CartsController < ApplicationController
	
	
	def update
		# raise params.inspect
		# x = Product.find(1)
		# raise x.inspect
		if params[:cart][:product_id]
			product =Product.find(params[:cart][:product_id])
			current_cart.products << product
		end

		if params[:cart][:product_ids]
			params[:cart][:product_ids].each do |product_id|
				current_cart.products.delete Product.find(product_id)
			end
		end
		redirect_to product_path(product)
	end

	#simple update mode
	# def update
	# 	product =Product.find(params[:cart][:product_id])
	# 	current_cart.products << product
	# 	redirect_to product_path(product)
	# end

	def edit
		@products =Cart.find(params[:id]).products

	end
end
