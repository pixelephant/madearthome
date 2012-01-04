class Category < ActiveRecord::Base
	has_many :children, :class_name => "Category"
	belongs_to :parent, :class_name => "Category",
		:foreign_key => "category_id"
	has_many :products
	has_many :property_categories_to_categories
	has_many :property_categories, :through => :property_categories_to_categories
	has_many :property_to_categories
	has_many :property, :through => :property_to_categories
end
