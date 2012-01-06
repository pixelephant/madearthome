class Product < ActiveRecord::Base
	has_many :photos
	belongs_to :category
	has_many :properties_to_products
	has_many :properties, :through => :properties_to_products
	has_many :wishlist_items
	has_many :advantages, :through => :advantages_to_products
	has_many :advantages_to_products
	belongs_to :designer
	belongs_to :manufacturer
	has_many :related_products, :class_name => "RelatedProduct", :foreign_key => "product_id"
	has_many :discounts_to_products
	has_many :discounts, :through => :discounts_to_products
	
	def default_photo
    return self.photos.where("photos.default = 1").first
  end
end
