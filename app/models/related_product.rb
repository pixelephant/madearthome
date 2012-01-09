class RelatedProduct < ActiveRecord::Base
	belongs_to :product, :class_name => "Product", :foreign_key => "product_id"
	belongs_to :related_product, :class_name => "Product", :foreign_key => "related_product_id"

	validates :related_product_id, :product_id, :presence => true

	validates :related_product_id, :uniqueness => { :scope => :product_id,
    :message => "Existing relation" }
end
