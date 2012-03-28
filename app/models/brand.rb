class Brand < ActiveRecord::Base

	mount_uploader :image_file, ImageUploader

	has_many :products
	has_many :designers
end
