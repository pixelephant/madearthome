class Property < ActiveRecord::Base
	has_many :properties_to_products
	has_many :products, :through => :properties_to_products
	belongs_to :property_category
	has_many :property_to_categories
	has_many :categories, :through => :property_to_categories
end
