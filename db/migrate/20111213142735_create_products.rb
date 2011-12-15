class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.integer :category_id

      t.timestamps
    end
  end
end
