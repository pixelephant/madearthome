module ApplicationHelper
	def product_has_property(property_id, product_id)
		Product.find(product_id).properties.where(:id => property_id).exists?
	end

	def is_active_category_with_index?(page_name, index)
		cl = []
    cl << 'active' if params[:id] == page_name
		cl << 'first' if index == 0
		cl << 'last' if Category.count == index + 1

		return raw ' class="' << cl.join(" ") << '"'
  end

	def is_a_number?(s)
		s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
	end
end
