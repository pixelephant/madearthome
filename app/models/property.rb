class Property < ActiveRecord::Base

	translates :property_name

	#has_many :properties_to_products
	#has_many :products, :through => :properties_to_products
	has_and_belongs_to_many :products

	has_many :properties_to_line_items
	has_many :line_items, :through => :properties_to_line_items

	belongs_to :property_category
	has_many :properties_to_category
	has_many :categories, :through => :properties_to_category

	has_many :properties_to_custom_categories
	has_many :custom_categories, :through => :properties_to_custom_categories

	has_and_belongs_to_many :product_sets

	validates :property_name, :presence => true

end
