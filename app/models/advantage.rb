class Advantage < ActiveRecord::Base

	translates :advantage

	has_many :products, :through => :advantages_to_products
	has_many :advantages_to_products

	validates :advantage, :presence => true

	validates :advantage, :uniqueness => true
end
