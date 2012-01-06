class RelatedProduct < ActiveRecord::Base
	belongs_to :product
	belongs_to :related_product, :class_name => "Product", :foreign_key => "related_product_id"
end
