class Property < ActiveRecord::Base
	#has_many :properties_to_products
	#has_many :products, :through => :properties_to_products
	has_and_belongs_to_many :products
	belongs_to :property_category
	has_many :properties_to_category
	has_many :categories, :through => :properties_to_category

	has_many :properties_to_custom_categories
	has_many :custom_categories, :through => :properties_to_custom_categories

	validates :property_name, :presence => true
end
