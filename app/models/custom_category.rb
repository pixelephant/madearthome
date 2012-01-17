class CustomCategory < ActiveRecord::Base
	has_many :properties, :through => :properties_to_custom_categories
	has_many :properties_to_custom_categories

	has_many :custom_categories_to_categories
	has_many :categories, :through => :custom_categories_to_categories
end
