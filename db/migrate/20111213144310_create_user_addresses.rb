class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.integer :user_id
      t.string :zip
      t.string :city
      t.string :street
      t.string :additional

      t.timestamps
    end
  end
end
