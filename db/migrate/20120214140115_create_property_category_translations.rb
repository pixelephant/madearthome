class CreatePropertyCategoryTranslations < ActiveRecord::Migration
  def change
    create_table :property_category_translations do |t|
			t.integer :property_category_id
      t.string :locale
      t.string :category_name

      t.timestamps
    end
  end
end
