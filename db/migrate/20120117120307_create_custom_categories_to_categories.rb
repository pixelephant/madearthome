class CreateCustomCategoriesToCategories < ActiveRecord::Migration
  def change
    create_table :custom_categories_to_categories do |t|
      t.integer :custom_category_id
      t.integer :category_id

      t.timestamps
    end
  end
end
