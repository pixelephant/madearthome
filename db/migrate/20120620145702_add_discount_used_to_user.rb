class AddDiscountUsedToUser < ActiveRecord::Migration
  def change
  	add_column :orders, :discount_used, :integer
  end
end
