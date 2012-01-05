# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

products = Product.create([{ name: "Test product", short_description: "Short test description", long_description: "Long long long description", category_id: 1, sku: "aaa111sku", price: "2500", designer_id: 1, manufacturer_id: 1}])

Photo.delete_all

photos = Photo.create([{ product_id: 1, image_file: File.open(File.join(Rails.root, '/public/uploads/image_file/01017-B.jpg')), alt: "Mirror", default: nil},{ product_id: 1, image_file: File.open(File.join(Rails.root, '/public/uploads/image_file/01053-B.jpg')), alt: "Mirror2", default: nil}])

Category.delete_all

categories = Category.create([{category_id: nil, name: "Parent category"},{category_id: 1, name: "Child category"}])

User.delete_all

users = User.create([{email: 's0d401@gmail.com', password: '$2a$10$6n9COFMmZlc0Nph48wDzueIylyHsuYFwk4f6BFrvLxIRhWdpYFthW', name: 'Pap Norbert'}, {email: '0antalbalazs0@gmail.com', password: '$2a$10$XlEaVhkDEo6ORBezlMPiq.R/5wrFeH7PybeqkMf7ksjvzZSRw4i9u', name: 'Antal Balázs'}])

UserAddress.delete_all

user_addresses = UserAddress.create([{user_id: 1, zip: '1234', city: 'Test city', street: 'Test street', additional: 'Test additional'}])

Order.delete_all

orders = Order.create([{shipping_address_id: 1, invoice_address_id: 1, user_id: 1, basket_serialization: "Test serialization"}])

OrderItem.delete_all

order_items = OrderItem.create([{order_id: 1, product_id: 1}, {order_id: 1, product_id: 2}])

Property.delete_all

properties = Property.create([{property_name: 'Test property 1', property_category_id: 1}, {property_name: 'Test property 2', property_category_id: 1}])

PropertyCategory.delete_all

property_categories = PropertyCategory.create([{category_name: 'Test property category'}])

PropertiesToProduct.delete_all

properties_to_categories = PropertiesToProduct.create([{property_id: 1, product_id: 1}])

Wishlist.delete_all

wishlists = Wishlist.create([{custom_url: nil, user_id: 1, public: false}])

WishlistItem.delete_all

wishlist_items = WishlistItem.create([{wishlist_id: 1, product_id: 1, sold: false}, {wishlist_id: 1, product_id: 2, sold: true}])

PropertyCategoriesToCategory.delete_all

property_cat_to_cat = PropertyCategoriesToCategory.create([{property_category_id: 1, category_id: 2}])

Advantage.delete_all

advantages = Advantage.create([{advantage: 'Nagy, ezert nagy helyen jol elfer.'}, {advantage: 'Kicsi, ezert kis helyen fer el.'}])

AdvantagesToProduct.delete_all

advantages_to_products = AdvantagesToProduct.create([{product_id: 1, advantage_id: 1}])

Manufacturer.delete_all

manufacturers = Manufacturer.create([{name: "Test manufacturer", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit, est vel dignissim scelerisque, quam tortor elementum dui, sed fermentum massa magna eu quam. Aliquam elementum tellus eu sem consequat a consequat justo condimentum. Maecenas dictum interdum diam nec tempus. Aenean feugiat laoreet ipsum sit amet luctus. Maecenas et mi sed diam lacinia lobortis sit amet id est. Pellentesque bibendum lacus in tortor tempor ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pellentesque vestibulum urna id sollicitudin. Morbi nec massa sed nisi sollicitudin venenatis. Nulla quis justo non magna sollicitudin pellentesque. "}])

Designer.delete_all

designers = Designer.create([{name: "Test designer", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit, est vel dignissim scelerisque, quam tortor elementum dui, sed fermentum massa magna eu quam. Aliquam elementum tellus eu sem consequat a consequat justo condimentum. Maecenas dictum interdum diam nec tempus. Aenean feugiat laoreet ipsum sit amet luctus. Maecenas et mi sed diam lacinia lobortis sit amet id est. Pellentesque bibendum lacus in tortor tempor ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla pellentesque vestibulum urna id sollicitudin. Morbi nec massa sed nisi sollicitudin venenatis. Nulla quis justo non magna sollicitudin pellentesque. "}])
