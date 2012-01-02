class CreateDiscountsToProducts < ActiveRecord::Migration
  def change
    create_table :discounts_to_products do |t|
      t.integer :product_id
      t.integer :discount_id

      t.timestamps
    end
  end
end
