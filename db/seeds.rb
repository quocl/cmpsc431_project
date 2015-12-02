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

Category.delete_all

cat = Category.create! id: 1, name: "Test"
cat.save!

SaleItem.delete_all

Order.delete_all



Orderstatus.delete_all
Orderstatus.create! id: 1, name: "Preparing to ship"
Orderstatus.create! id: 2, name: "Shipping now"
Orderstatus.create! id: 3, name: "Shipped"
Orderstatus.create! id: 4, name: "Cancelled"