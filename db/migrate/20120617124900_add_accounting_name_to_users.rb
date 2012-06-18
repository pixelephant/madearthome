class AddAccountingNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :accounting_name, :string
  end
end
