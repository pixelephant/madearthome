class PropertyCategory < ActiveRecord::Base
	has_many :properties
	has_many :property_categories_to_categories
	has_many :categories, :through => :property_categories_to_categories

	has_many :category_translations

	validates :category_name, :presence => true

	def translate

		ignore = ["id","created_at","updated_at","locale","property_category_id"]

		if I18n.locale.to_s != I18n.default_locale.to_s
			translation = PropertyCategoryTranslations.where(:property_category_id => self, :locale => I18n.locale.to_s)
			if !translation.empty?
				attributes = translation.first.attributes.keys
				attributes.delete_if {|x| ignore.include?(x)}
				attributes.each do |a|
					self.send("#{a}=", translation.first.send(a.to_sym)) if !translation.first.send(a.to_sym).blank?
				end
			end
		end
		self
	end
end
