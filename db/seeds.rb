# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
michael_phelps = Customer.create!(name: "Michael Phelps")

sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

bananas = sprouts.items.create!(name: "Bananas", price: 1)
apples = sprouts.items.create!(name: "Apples", price: 2)
oranges = sprouts.items.create!(name: "Oranges", price: 3)

CustomerItem.create!(customer_id: michael_phelps.id, item_id: bananas.id)
CustomerItem.create!(customer_id: michael_phelps.id, item_id: apples.id)
CustomerItem.create!(customer_id: michael_phelps.id, item_id: oranges.id)