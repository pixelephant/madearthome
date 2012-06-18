class AddDefaultToUserAddresses < ActiveRecord::Migration
  def change
  	add_column :user_addresses, :default, :boolean
  end
end
