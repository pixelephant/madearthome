class CustomCategory < ActiveRecord::Base
	has_many :properties, :through => :properties_to_custom_categories
	has_many :properties_to_custom_categories

	belongs_to :category

	validates :name,:category_id , :presence => true
	
end
