class PropertiesToLineItems < ActiveRecord::Base
	belongs_to :property
	belongs_to :line_item
end
