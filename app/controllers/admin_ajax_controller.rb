class AdminAjaxController < ApplicationController
	def getCategoryProperties
		respond_to do |format|
			cat = params[:category_id].to_i
			msg = "["

			if Category.exists?(cat)
#				msg = Category.find(cat).property_categories.any? ? Category.find(cat).property_categories.to_json(:only => [:id]) : ""
				Category.find(cat).property_categories.each do |category|
					msg << category.properties.to_json(:only => [:id]) if category.properties.any?
				end
			end

#			msg2 = Property.where("property_category_id IS NULL").any? ? Property.where("property_category_id IS NULL").to_json(:only => [:id]) : ""

				#Property.where("property_category_id IS NULL").each do |property|
					#msg << property.to_json(:only => [:id])
				#end

			msg << Property.where("property_category_id IS NULL").to_json(:only => [:id]) if Property.where("property_category_id IS NULL").any?

			msg << "]"


			format.json {
				render :json => {:error => "none", :prop_ids => msg}
			}
		end
	end
end
