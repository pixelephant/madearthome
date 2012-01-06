class Category < ActiveRecord::Base
	has_many :children, :class_name => "Category"
	belongs_to :parent, :class_name => "Category",
		:foreign_key => "category_id"
	has_many :products
	has_many :property_categories_to_categories
	has_many :property_categories, :through => :property_categories_to_categories
	has_many :properties_to_category
	has_many :property, :through => :properties_to_category

	validates :name, :presence => true
end
