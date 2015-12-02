# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

user1 = User.create! id:1, last_name: "Doe", first_name: "John", email: "JD@JD.com", username: "JohnD",usergroup: 1, password: "12345678", password_confirmation: "12345678"
user1.save!
user2 = User.create! id:2, last_name: "Admin", first_name: "Admin", email: "admin@admin.com", username: "admin",usergroup: 0, password: "adminadmin", password_confirmation: "adminadmin"
user2.save!
user3 = User.create! id:3, last_name: "Doe", first_name: "Prime John", email: "PrimeJD@JD.com", username: "PrimeJohnD",usergroup: 2, password: "12345678", password_confirmation: "12345678"
user3.save!


SaleItem.delete_all
a = SaleItem.create! id: 1, user_id: "1", item_name: "Dumb", item_price: 5, item_description: "This is a text item." , item_location: "PA"
b = SaleItem.create! id: 2, user_id: "2", item_name: "Loofah", item_price: 6, item_description: "This is a text item." , item_location: "PA"
c = SaleItem.create! id: 3, user_id: "3", item_name: "Coffee", item_price: 75, item_description: "This is a text item." , item_location: "PA"
d = SaleItem.create! id: 4, user_id: "1", item_name: "Homebrew", item_price: 5.3, item_description: "This is a text item." , item_location: "PA"
e = SaleItem.create! id: 5, user_id: "2", item_name: "Beautiful Soup", item_price: 5.31, item_description: "This is a text item." , item_location: "PA"
a.save!
b.save!
c.save!
d.save!
e.save!


Order.delete_all



Orderstatus.delete_all
Orderstatus.create! id: 1, name: "Preparing to ship"
Orderstatus.create! id: 2, name: "Shipping now"
Orderstatus.create! id: 3, name: "Shipped"
Orderstatus.create! id: 4, name: "Cancelled"