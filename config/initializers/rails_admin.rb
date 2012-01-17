RailsAdmin.config do |config|

	#Add all excluded models here:
	config.excluded_models = [PropertiesToProduct, Wishlist, WishlistItem, PropertyCategoriesToCategory,AdvantagesToProduct,DiscountsToProduct,PropertiesToCategory,RelatedProduct,
PropertiesToCustomCategory,CustomCategoriesToCategory]

	#Category
	config.model Category do
		edit do
			exclude_fields :custom_categories
		end
	end

	#Property 
	config.model Property do
		#Property name
		object_label_method do
			:property_label_method
		end
		edit do
			exclude_fields :categories, :custom_categories
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
			
			field :products_related_to do
				associated_collection_scope do
					product = bindings[:object]
					Proc.new { |scope|
						scope = scope.where("products.id != ?", product.id) if product.id.present?
						scope
					}
				end
			end
			include_all_fields
			exclude_fields :properties_to_products, :advantages_to_products, :discounts_to_products, :products_related_of
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
		if self.property_category.nil?
			self.property_name
		else
			self.property_category.category_name + ": " + self.property_name
		end
	end

	def property_category_label_method
		self.category_name
	end

	def photo_label_method
		self.alt
	end

	def related_product_label_method
		self.products_related_to.name
	end

	def advantage_label_method
		self.advantage
	end

	def discount_label_method
		type = self.discount_type == 2 ? ' %' : ''
		self.value.to_s << type
	end

end
