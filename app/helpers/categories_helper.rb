module CategoriesHelper
	def bottomCategories
		Category.find_by_sql("SELECT c.* FROM categories c LEFT JOIN categories c2 ON c.id=c2.parent_id WHERE c2.name IS NULL")
	end
end
