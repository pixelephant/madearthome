class Category < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :products
	has_many :property_categories_to_categories
	has_many :property_categories, :through => :property_categories_to_categories
	has_many :properties_to_category
	has_many :properties, :through => :properties_to_category

	has_many :custom_categories

	belongs_to :discount
	
	has_many :category_translations

	validates :name, :presence => true

	def translate

		ignore = ["id","created_at","updated_at","locale","category_id"]		

		if I18n.locale.to_s != I18n.default_locale.to_s
			translation = CategoryTranslation.where(:category_id => self, :locale => I18n.locale.to_s)
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
