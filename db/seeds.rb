# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

products = Product.create([{ name: "Test product", short_description: "Short test description", long_description: "Long long long description", category_id: 1}])

Photo.delete_all

photos = Photo.create([{ product_id: 1, image_url: "test.url", alt: "Alt text", default: nil}])

Category.delete_all

categories = Category.create([{parent_id: nil, name: "Parent category"},{parent_id: 1, name: "Child category"}])

User.delete_all

users = User.create([{email: 'test@email.ad', password: 'password', name: 'Test User'}])

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
