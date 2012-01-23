class Manufacturer < ActiveRecord::Base
	has_many :products
	has_many :manufacturer_photos

	validates :name, :description, :presence => true
end
