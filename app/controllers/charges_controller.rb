class ChargesController < ApplicationController

	def index
	end
	
	def new
	end

	def create
	  # Amount in cents
	  @amount = (current_cart.total() * 100).to_i

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'gbp'
	  )
	  clear_my_basket
	  redirect_to products_path
	  
	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to products_path
	end

end
