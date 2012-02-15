class CreatePropertyTranslations < ActiveRecord::Migration
  def change
    create_table :property_translations do |t|
      t.integer :property_id
      t.string :locale
      t.string :property_name

      t.timestamps
    end
  end
end
