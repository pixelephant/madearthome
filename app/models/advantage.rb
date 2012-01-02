class Advantage < ActiveRecord::Base
	has_many :products, :through => :advantages_to_products
	has_many :advantages_to_products
end
