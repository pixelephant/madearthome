class Designer < ActiveRecord::Base

	translates :description

	has_many :products
	has_many :designer_photos

	validates :name, :description, :presence => true
end
