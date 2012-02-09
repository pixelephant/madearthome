class CreateProductTranslations < ActiveRecord::Migration
  def change
    create_table :product_translations do |t|
      t.integer :product_id
      t.string :locale
      t.string :name
      t.string :short_description
      t.text :long_description
      t.text :advice

      t.timestamps
    end
  end
end
