class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :zip, :null => false
      t.string :city, :null => false
      t.string :street, :null => false
      t.string :additional, :null => false

      t.timestamps
    end
  end
end
