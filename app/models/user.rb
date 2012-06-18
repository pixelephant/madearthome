class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  	attr_accessible :email, :password, :password_confirmation, :remember_me, :addresses_attributes
	has_many :user_addresses
	has_many :orders
	has_one :wishlist

	accepts_nested_attributes_for :user_addresses

  def order_sum
    sum = 0
    self.orders.each do |order|
      order.order_items.each do |item|
        sum = sum + (item.quantity * item.price)
      end
    end

    return sum
  end

end
