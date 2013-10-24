class ProductsController < ApplicationController

	def index
		@products =Product.all.order("products.name ASC").limit(10)
	end
	def show
		@product =Product.find(params[:id]) 
	end

	def new
		@product =Product.new
	end

	def create
	    @product = Product.create(params[:product]
	                              .permit(:name, :image))
	    redirect_to @product

	  	# rescue AWS::S3::Errors::RequestTimeout
	   #  flash[:notice] = "Upload timed out"
	   #  redirect_to 'new'
  	end

  	def edit
  		@products =Product.all.map {|el| p el.id}
  		@product =Product.find(params[:id])
  	end

  	def update
  		@product = Product.find(params[:id])
  		if @product.update_attributes(prod_params)
	  		flash[:notice]="Your Record Was Updated!"
	  		redirect_to(action: 'show',id: @product.id)
	  	else
	  		flash.now[:errors]=@product.errors.full_messages.join('')
	  		render ('edit')
	  	end
  	end
  	
  	def destroy
  		@product =Product.find(params[:id])
  		@product.destroy
  		redirect_to products_path
  	end

	def prod_params
		params.require(:product).permit(:name,:description,:image,:price)
	end	


end
