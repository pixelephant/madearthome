RailsAdmin.config do |config|

	#Add all excluded models here:
	config.excluded_models = [PropertiesToProduct, Wishlist, WishlistItem, PropertyCategoriesToCategory,AdvantagesToProduct,DiscountsToProduct,PropertiesToCategory]

	#Property 
	config.model Property do
		#Property name
		object_label_method do
			:property_label_method
		end
		edit do
			exclude_fields :categories
		end
	end

	#PropertyCategory
	config.model PropertyCategory do
		#PropertyCategory name
		object_label_method do
			:property_category_label_method
		end
	end

	#Product
	config.model Product do
		#Product edit form
		edit do
			field :category do
				partial "category_select"
			end
			include_all_fields
			exclude_fields :properties_to_products, :advantages_to_products, :discounts_to_products
		end		
	end

	#Category
	config.model Category do
		#Category edit form
		edit do
			field :category do
				partial "category_select"
			end
			include_all_fields
			exclude_fields :children, :parent
		end		
	end

	#Photos name
	config.model Photo do
		object_label_method do
			:photo_label_method
		end
	end

	#Custom label methods
	def property_label_method
		self.property_name
	end

	def property_category_label_method
		self.category_name
	end

	def photo_label_method
		self.alt
	end

end
