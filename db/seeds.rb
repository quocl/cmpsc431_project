# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Orderstatus.delete_all
Orderstatus.create! id: 1, name: "Preparing to ship"
Orderstatus.create! id: 2, name: "Shipping now"
Orderstatus.create! id: 3, name: "Shipped"
Orderstatus.create! id: 4, name: "Cancelled"