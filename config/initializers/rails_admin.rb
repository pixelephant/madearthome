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
				partial "category_select"
			end
			field :products_related_to do
				product = bindings[:object]
				#Proc.new {
					#scope = Product.where("product.id != ?", product.id)
				#}
			end
			include_all_fields
			exclude_fields :properties_to_products, :advantages_to_products, :discounts_to_products
		end		
	end

	#Category
	config.model Category do
		#Category edit form
		edit do
			field :parent do
#				render do
#					bindings[:view].render :partial => "category_select", :locals => { :field => self, :form => bindings[:form]}
#				end
				partial "category_select"
			end
			include_all_fields
			exclude_fields :children
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

end
