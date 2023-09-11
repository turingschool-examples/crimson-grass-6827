# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

customer_1 = Customer.create!(name: "Sally Shopper")

customer_2 = Customer.create!(name: "Bobby Buyer")

supermarket_1 = Supermarket.create!(
  name: "Corner Market",
  location: "123 Food Street"
)

banana = supermarket_1.items.create!(
  name: "Banana",
  price: 1
)

apple = supermarket_1.items.create!(
  name: "Apple",
  price: 2
)

orange = supermarket_1.items.create!(
  name: "Orange",
  price: 3
)

CustomerItem.create!(customer: customer_1, item: banana)
CustomerItem.create!(customer: customer_1, item: apple)

CustomerItem.create!(customer: customer_2, item: banana)