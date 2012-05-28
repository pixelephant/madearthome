class CreateCustomCategoryGroups < ActiveRecord::Migration
  def change
    create_table :custom_category_groups do |t|
    	t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
