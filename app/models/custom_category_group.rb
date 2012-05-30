class CustomCategoryGroup < ActiveRecord::Base
	translates :name

	has_many :custom_categories
end
