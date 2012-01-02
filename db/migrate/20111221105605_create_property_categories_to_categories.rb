class CreatePropertyCategoriesToCategories < ActiveRecord::Migration
  def change
    create_table :property_categories_to_categories do |t|
      t.integer :property_category_id
      t.integer :category_id

      t.timestamps
    end
  end
end
