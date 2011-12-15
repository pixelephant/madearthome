class CreatePropertiesToProducts < ActiveRecord::Migration
  def change
    create_table :properties_to_products do |t|
      t.integer :property_id
      t.integer :product_id

      t.timestamps
    end
  end
end
