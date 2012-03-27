class Brand < ActiveRecord::Base
	has_many :products
	has_many :designers
end
