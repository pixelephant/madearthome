class CreateDesigners < ActiveRecord::Migration
  def change
    create_table :designers do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
