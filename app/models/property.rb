class Property < ActiveRecord::Base
	has_many :properties_to_products
	has_many :products, :through => :properties_to_products
	belongs_to :property_category
	has_many :properties_to_category
	has_many :categories, :through => :properties_to_category
end
