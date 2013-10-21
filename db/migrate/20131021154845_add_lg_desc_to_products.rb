class AddLgDescToProducts < ActiveRecord::Migration
  def change
    add_column :products, :lg_desc, :text
  end
end
