class PropertyCategory < ActiveRecord::Base
	has_many :properties
	has_many :property_categories_to_categories
	has_many :categories, :through => :property_categories_to_categories

	validates :category_name, :presence => true
end
