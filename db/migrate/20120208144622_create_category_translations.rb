class CreateCategoryTranslations < ActiveRecord::Migration
  def change
    create_table :category_translations do |t|
      t.integer :category_id
      t.string :locale
      t.string :name

      t.timestamps
    end
  end
end
