class User < ActiveRecord::Base
	has_many :user_addresses
	has_many :orders
	has_one :wishlist
end
