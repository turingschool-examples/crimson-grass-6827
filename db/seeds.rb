# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
market1 = Supermarket.create(name: "Supermercado", location: "123 Food St.")
item1 = market1.items.create(name: "Banana", price: 1)
item2 = market1.items.create(name: "Coffee", price: 3)
item3 = market1.items.create(name: "Pasta", price: 3)
customer1 = Customer.create(name: "Guy")