class Manufacturer < ActiveRecord::Base

	translates :description

	has_many :products
	has_many :manufacturer_photos

	validates :name, :description, :presence => true
end
