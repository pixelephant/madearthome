class Order < ActiveRecord::Base
	belongs_to :user
	has_many :order_items
	belongs_to :shipping_address, :class_name => "Address", :foreign_key => "shipping_address_id"
	belongs_to :invoice_address, :class_name => "Address", :foreign_key => "invoice_address_id"

	def order_sum
		sum = 0
		self.order_items.each do |item|
			sum = sum + (item.quantity * item.price)
		end
		return sum
	end

end
