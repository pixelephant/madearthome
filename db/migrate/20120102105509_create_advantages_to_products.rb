class CreateAdvantagesToProducts < ActiveRecord::Migration
  def change
    create_table :advantages_to_products do |t|
      t.integer :product_id
      t.integer :advantage_id

      t.timestamps
    end
  end
end
