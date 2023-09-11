# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
item_1 = supermarket_1.items.create!(name: "Tuna", price: 2)
item_2 = supermarket_1.items.create!(name: "Red Snapper", price: 5)
item_3 = supermarket_1.items.create!(name: "Salmon", price: 3)
customer_1 = Customer.create!(name: "Tyler")
customer_2 = Customer.create!(name: "Kiwi")
customer_3 = Customer.create!(name: "Chicken")
CustomerItem.create!(item_id: item_1.id, customer_id: customer_1.id)
CustomerItem.create!(item_id: item_1.id, customer_id: customer_2.id)
CustomerItem.create!(item_id: item_2.id, customer_id: customer_1.id)
