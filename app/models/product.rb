class Product < ActiveRecord::Base

	has_and_belongs_to_many :carts
  	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	
end
