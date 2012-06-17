class AddPriceQuantityToOrderItem < ActiveRecord::Migration
  def change
  	add_column :order_items, :quantity, :integer
  	add_column :order_items, :price, :integer
  end
end
