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
	
	#has_many :related_products_of, :class_name => "RelatedProduct", :foreign_key => "product_id"
	#has_many :related_to, :class_name => "RelatedProduct", :foreign_key => "related_product_id"

	has_many :related_products
	has_many :products_related_to, :through => :related_products, :foreign_key => "related_product_id", :dependent => :destroy
	has_many :products_related_of, :through => :related_products, :foreign_key => "product_id", :dependent => :destroy

	has_many :discounts_to_products
	has_many :discounts, :through => :discounts_to_products
	
	validates :name, :sku, :price, :category, :presence => true

	validates :sku, :name, :uniqueness => true

	def default_photo
		default = self.photos.where("photos.default = 1").exists? ? self.photos.where("photos.default = 1").first : self.photos.first
    return default
  end
end
