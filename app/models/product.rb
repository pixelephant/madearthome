class Product < ActiveRecord::Base
	has_many :photos
	belongs_to :category
	has_many :properties_to_products
	has_many :properties, :through => :properties_to_products
	has_many :wishlist_items
end
