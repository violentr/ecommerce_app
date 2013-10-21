class AddPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price, :float
    add_column :products, :currency, :string
  end
end
