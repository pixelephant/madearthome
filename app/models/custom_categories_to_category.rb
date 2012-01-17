class CustomCategoriesToCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :custom_category
end
