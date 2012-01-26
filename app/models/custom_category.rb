class CustomCategory < ActiveRecord::Base
	has_many :properties, :through => :properties_to_custom_categories
	has_many :properties_to_custom_categories

	belongs_to :category

	belongs_to :discount

	validates :name,:category_id , :presence => true
	
	def get_products
		properties_of_custom_category = self.properties

		p = Product.find(:all, :joins => :properties, :select => "products.*, count(properties.id)", :conditions => ["properties.id IN (?) AND products.category_id = ?", properties_of_custom_category, self.category_id], :group => "products.id having count(properties.id) = #{properties_of_custom_category.count}")

		return p
	end

end
