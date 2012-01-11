class RelatedProduct < ActiveRecord::Base
	belongs_to :products_related_to, :class_name => "Product", :foreign_key => "related_product_id"
	belongs_to :products_related_of, :class_name => "Product", :foreign_key => "product_id"

	#validates :related_product_id, :product_id, :presence => true

	validates :related_product_id, :uniqueness => { :scope => :product_id,
    :message => "Existing relation" }

	if :product_id == nil || :related_product_id == nil
		@related_product = RelatedProduct.where(:product_id => :product_id, :related_product_id => :related_product_id)
		@related_product.each do |rel|
			rel.destroy
		end
	end
end
