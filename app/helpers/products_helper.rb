module ProductsHelper

	def productPrice(product_id)
		p = Product.find(product_id)
		price = p.price
		
		p.discounts.each do |d|
			if d.discount_type == 1
				price = price - d.value
			end

			if d.discount_type == 2
				price = price - (price * (d.value.to_f / 100))
			end
		end

		return price.round
	end

end
