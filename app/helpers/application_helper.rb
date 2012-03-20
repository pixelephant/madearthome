module ApplicationHelper

	def box_class(number)
		cl = ""
		cl = " mid" if number == 1
		cl = " last" if number == 2
		cl
	end

	def product_has_property(property_id, product_id)
		Product.find(product_id).properties.where(:id => property_id).exists?
	end

	def is_active_category_with_index?(page_name, index)
		cl = []
    cl << 'active' if params[:id] == page_name
		cl << 'first' if index == 0
		cl << 'last' if (Category.count && !Content.all.any?) == index + 1

		return raw ' class="' << cl.join(" ") << '"'
  end

	def is_a_number?(s)
		s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
	end

	def cart_count
		if Cart.exists?(session[:cart_id])
			cart = Cart.find(session[:cart_id])
			count = 0
			cart.line_items.each do |item|
				count += item.quantity
			end
		count
		else
			nil
		end
	end

	def cart_subtotal
		if Cart.exists?(session[:cart_id])
			cart = Cart.find(session[:cart_id])
			subtotal = 0
			cart.line_items.each do |item|
				subtotal += (item.quantity * item.product.price)
			end
		subtotal
		else
			nil
		end
	end

	def lead(string)
		return '' if string.blank?
		s = string.split(' ', 5)
		if s.length > 4
			i = s[0..3].join(" ")
			e = s[4]
		else
			i = s.join(" ")
			e = ''
		end
		'<span class="lead">' + i.to_s + '</span> ' + e.to_s
	end

end
