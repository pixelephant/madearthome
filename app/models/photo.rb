class Photo < ActiveRecord::Base
	belongs_to :product
	mount_uploader :image_file, ImageUploader
end
