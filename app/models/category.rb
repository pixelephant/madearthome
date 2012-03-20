class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	translates :name

	has_many :products
	has_many :property_categories_to_categories
	has_many :property_categories, :through => :property_categories_to_categories
	has_many :properties_to_category
	has_many :properties, :through => :properties_to_category

	has_many :custom_categories

	belongs_to :discount

	validates :name, :presence => true

end
