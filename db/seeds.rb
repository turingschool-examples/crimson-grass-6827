# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
michael_phelps = Customer.create!(name: "Michael Phelps")
serena_williams = Customer.create!(name: "Serena Williams")

sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

bananas = sprouts.items.create!(name: "Bananas", price: 1)
apples = sprouts.items.create!(name: "Apples", price: 2)
oranges = sprouts.items.create!(name: "Oranges", price: 3)
peaches = sprouts.items.create!(name: "Peaches", price: 4)


CustomerItem.create!(customer_id: michael_phelps.id, item_id: bananas.id)
CustomerItem.create!(customer_id: michael_phelps.id, item_id: apples.id)
CustomerItem.create!(customer_id: michael_phelps.id, item_id: oranges.id)
CustomerItem.create!(customer_id: serena_williams.id, item_id: apples.id)
CustomerItem.create!(customer_id: serena_williams.id, item_id: oranges.id)
CustomerItem.create!(customer_id: serena_williams.id, item_id: peaches.id)