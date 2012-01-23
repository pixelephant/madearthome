class CustomCategory < ActiveRecord::Base
	has_many :properties, :through => :properties_to_custom_categories
	has_many :properties_to_custom_categories

	belongs_to :category

	belongs_to :discount

	validates :name,:category_id , :presence => true
	
	def get_products
		return Product.all
	end

end
