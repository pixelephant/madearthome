class Address < ActiveRecord::Base
	belongs_to :user

	attr_accessible :zip, :city, :additional
end
