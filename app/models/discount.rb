class Discount < ActiveRecord::Base
	has_many :discounts_to_products
	has_many :products, :through => :discounts_to_products
end
