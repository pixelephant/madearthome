class AddPriceToProducts < ActiveRecord::Migration
  def up
		change_table :products do |t|
      t.integer :price
		end
  end

	def down
		remove_column :products, :price
	end
end
