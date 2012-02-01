class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :photos
	belongs_to :category
#	has_many :properties_to_products
#	has_many :properties, :through => :properties_to_products
	has_and_belongs_to_many :properties
	has_and_belongs_to_many :links
	has_and_belongs_to_many :stores

	has_many :wishlist_items
	has_many :advantages, :through => :advantages_to_products
	has_many :advantages_to_products
	belongs_to :designer
	belongs_to :manufacturer
	
	has_many :related_products
	has_many :product_relates, :through => :related_products, :foreign_key => "product_id"
	has_many :inverse_related_products, :class_name => "RelatedProduct", :foreign_key => "related_product_id"
	has_many :inverse_product_relates, :through => :inverse_related_products, :source => :product

	has_many :discounts_to_products
	has_many :discounts, :through => :discounts_to_products
	
	validates :name, :sku, :price, :category, :presence => true

	validates :sku, :name, :uniqueness => true

	has_many :order_items

	has_many :line_items

	def default_photo
		default = self.photos.where("photos.default = 1").exists? ? self.photos.where("photos.default = 1").first : self.photos.first
    return default
  end

	def self.products_on_sale
		self.find(:all, :joins => :discounts, :select => "products.*", :conditions => ["discounts.id IS NOT NULL"], :group => "products.id")
	end

end
