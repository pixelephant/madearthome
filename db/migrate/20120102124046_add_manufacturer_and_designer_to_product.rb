class AddManufacturerAndDesignerToProduct < ActiveRecord::Migration
	def up
		change_table :products do |t|
      t.integer :designer_id
      t.integer :manufacturer_id
		end
  end

	def down
		remove_column :products, :manufacturer_id
		remove_column :products, :designer_id
	end
end
