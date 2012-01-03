class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :discountType
      t.integer :value

      t.timestamps
    end
  end
end
