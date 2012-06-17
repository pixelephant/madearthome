class AddEstimatedDateToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :estimated_date, :date
  end
end
