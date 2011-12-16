module ApplicationHelper
	def product_has_property(property_id, product_id)
		Product.find(product_id).properties.where(:id => property_id).exists?
	end
end
