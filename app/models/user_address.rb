class UserAddress < ActiveRecord::Base
	belongs_to :user

	attr_accessible :zip, :city, :additional, :billing
end
