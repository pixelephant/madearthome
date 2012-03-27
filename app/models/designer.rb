class Designer < ActiveRecord::Base

	translates :description

	has_many :products
	has_many :designer_photos

	belongs_to :brand

	validates :name, :description, :presence => true
end
