namespace :import do

  desc "import all images from public/import_images folder, attach to product with sku same as image filename"
  task :images => :environment do
    # get all images from given folder
		counter = 0
		product_counter = 0
		puts "Processing directory"
    Dir.glob(File.join('public/import_images', "*")) do |file_path|
      # create new model for every picture found and save it to db
      open(file_path) do |f|
				puts File.basename(file_path)
				fname = File.basename(file_path, File.extname(File.basename(file_path)))
				counter += 1
				if Product.exists?(:sku => fname)
					p = Product.where(:sku => fname).first
		      pict = Photo.new(:alt => p.name,
		                         :image_file => f,
													:product_id => p.id)
		      # carrierwave transformation
		      pict.save!
					product_counter += 1
		      FileUtils.rm(file_path)
				end
      end
      # Move processed image somewhere else or just remove it. It is
      # necessary as there is a risk of "double import"
      #FileUtils.mv(file_path, "....")
    end
		puts "Files found: " << counter.to_s
		puts "Files attached to product: " << product_counter.to_s
		puts "Files without product: " << (counter - product_counter).to_s
		puts "All attached files removed permanently!"
  end

end
