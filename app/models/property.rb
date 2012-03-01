class Property < ActiveRecord::Base
	#has_many :properties_to_products
	#has_many :products, :through => :properties_to_products
	has_and_belongs_to_many :products

	has_many :properties_to_line_items
	has_many :line_items, :through => :properties_to_line_items

	belongs_to :property_category
	has_many :properties_to_category
	has_many :categories, :through => :properties_to_category

	has_many :properties_to_custom_categories
	has_many :custom_categories, :through => :properties_to_custom_categories

	validates :property_name, :presence => true

	def translate

		ignore = ["id","created_at","updated_at","locale","property_id"]

		if I18n.locale.to_s != I18n.default_locale.to_s
			translation = PropertyTranslation.where(:property_id => self, :locale => I18n.locale.to_s)
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
