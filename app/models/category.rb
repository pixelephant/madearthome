class Category < ActiveRecord::Base
	has_many :products
	has_many :property_categories_to_categories
	has_many :property_categories, :through => :property_categories_to_categories
	has_many :properties_to_category
	has_many :property, :through => :properties_to_category

	has_many :custom_categories_to_categories
	has_many :custom_categories, :through => :custom_categories_to_categories

	validates :name, :presence => true
end
