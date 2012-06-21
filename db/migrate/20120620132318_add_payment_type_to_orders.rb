class AddPaymentTypeToOrders < ActiveRecord::Migration
  def change
  	 add_column :orders, :payment_type, :integer
  end
end
