class CreateAdvantages < ActiveRecord::Migration
  def change
    create_table :advantages do |t|
      t.string :advantage

      t.timestamps
    end
  end
end
