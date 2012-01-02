class AdvantagesToProduct < ActiveRecord::Base
	belongs_to :product
	belongs_to :advantage
end
