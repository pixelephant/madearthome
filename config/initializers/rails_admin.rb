RailsAdmin.config do |config|

	#Add all excluded models here:
	config.excluded_models = [PropertiesToProduct, Wishlist, WishlistItem, PropertyCategoriesToCategory,AdvantagesToProduct,DiscountsToProduct,PropertiesToCategory,RelatedProduct]

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
				associated_collection_scope do
					Proc.new { |scope|
						scope = scope.where("category_id IS NULL")
						scope
					}
				end
			end
			field :products_related_to
			include_all_fields
			exclude_fields :properties_to_products, :advantages_to_products, :discounts_to_products
		end		
	end

	#Category
	config.model Category do
		#Category edit form
		edit do
			field :parent do
				associated_collection_scope do
					Proc.new { |scope|
						scope = scope.where("category_id IS NULL")
						scope
					}
				end
			end
			include_all_fields
			exclude_fields :children
		end		
	end

	#Discount
	config.model Discount do
		#Discount list view
		list do
			field :id
			field :discount_type do
				pretty_value do
					value == 1 ? 'Percent' : 'Value'
				end
			end
			include_all_fields
			exclude_fields :products
		end
		#Discount list view
		show do
			field :id
			field :discount_type do
				pretty_value do
					value == 1 ? 'Percent' : 'Value'
				end
			end
			include_all_fields
			exclude_fields :products
		end
		#Discount edit form
		edit do
			field :discount_type do
				partial "discount_dropdown"
			end
			include_all_fields
			exclude_fields :products
		end
		object_label_method do
			:discount_label_method
		end		
	end

	#Photos name
	config.model Photo do
		object_label_method do
			:photo_label_method
		end
	end

	#RelatedProducts name
	config.model RelatedProduct do
		object_label_method do
			:related_product_label_method
		end
	end

	#Advantage name
	config.model Advantage do
		object_label_method do
			:advantage_label_method
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

	def related_product_label_method
		self.related_product.name
	end

	def advantage_label_method
		self.advantage
	end

	def discount_label_method
		type = self.discount_type == 1 ? ' %' : ''
		self.value.to_s << type
	end

end
