class CreatePropertiesToCategories < ActiveRecord::Migration
  def change
    create_table :properties_to_categories do |t|
      t.integer :property_id
      t.integer :category_id

      t.timestamps
    end
  end
end
