class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
		add_insdex :categories, :slug
  end
end
