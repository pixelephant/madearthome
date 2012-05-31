namespace :import do

  desc "import products from uttermost.csv"
  task :uttermost => :environment do
  	time = Time.now
		counter = 0
		product_counter = 0
		prop_cat = []
		puts "Searching for uttermost.csv..."
 
		CSV.foreach("public/uttermost.csv", :quote_char => '"', :col_sep =>',', :row_sep =>:auto) do |row|
	  	if counter == 0
	  		for i in 5..11
	  			if PropertyCategory.exists?(:category_name => row[i].strip.downcase)
	  				pc = PropertyCategory.where(:category_name => row[i].strip.downcase).first
	  				prop_cat << pc.id
	  			else
	  				pc = PropertyCategory.new(:category_name => row[i].strip.downcase)
	  				pc.save!
	  				prop_cat << pc.id
	  			end
	  		end
	  	else
	  		unless Product.exists?(:sku => row[0].strip.downcase)
	  			p = Product.new(:sku => row[0].strip.downcase, :name => row[2].strip.downcase, :price => row[3].strip, :long_description => row[14].strip)
	  			#ANYAG
	  			unless row[5].blank?
		  			anyag = row[5].split(',')
		  			anyag.each do |a|
		  				if Property.where(:property_name => a.strip.downcase, :property_category_id => prop_cat[0]).any?
		  					prop = Property.where(:property_name => a.strip.downcase).first
		  				else
		  					prop = Property.new(:property_name => a.strip.downcase, :property_category_id => prop_cat[0])
		  					prop.save!
		  				end
		  				p.properties << prop
		  			end
		  		end
	  			#TÖBBI
	  			for i in 5..11
	  				unless row[i].blank?
			  			if Property.where(:property_name => row[i].strip.downcase, :property_category_id => prop_cat[(i-5)]).any?
		  					prop = Property.where(:property_name => row[i].strip.downcase, :property_category_id => prop_cat[(i-5)]).first
		  					p.properties << prop
		  				else
		  					unless row[i].blank?
			  					prop = Property.new(:property_name => row[i].strip.downcase, :property_category_id => prop_cat[(i-5)])
			  					prop.save!
			  					p.properties << prop
			  				end
		  				end
		  			end
	  			end
	  			#TÖBBI VÉGE
	  			#DESIGNER
	  			unless row[12].blank?
	  				if Designer.where(:name => row[12]).any?
	  					des = Designer.where(:name => row[12]).first
	  				else
	  					des = Designer.new(:name => row[12], :description => '-')
	  					des.save!
	  				end
	  				p.designer_id = des.id
	  			end
	  				#IDEIGLENESEN MINDEN AZ ELSO KATEGORIA
	  				p.category_id = 2
	  			#DESIGNER VÉGE
	  			if p.save
			  		product_counter = product_counter + 1
			  		puts "Succesfully saved: " + counter.to_s + ", sku: " + row[0].to_s
			  	else
			  		puts "Error with product: " + counter.to_s
			  	end
	  		end
	  	end
			counter = counter + 1
		end
    
		puts "Files found: " << counter.to_s
		puts "Files attached to product: " << product_counter.to_s
		puts "Files without product: " << (counter - product_counter).to_s
		puts "All attached files removed permanently!"
		puts time_ago_in_words(Time.now - time)
  end

end
