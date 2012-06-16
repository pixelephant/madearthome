class AddNumericToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :num, :float
  end
end
