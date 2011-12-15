class Category < ActiveRecord::Base
	has_many :children, :class_name => "Category"
	belongs_to :parent, :class_name => "Category",
		:foreign_key => "parent_id"
	has_many :products
end
