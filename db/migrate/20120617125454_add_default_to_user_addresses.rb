class AddDefaultToUserAddresses < ActiveRecord::Migration
  def change
  	add_column :addresses, :default, :boolean
  end
end
