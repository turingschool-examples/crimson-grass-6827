# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CustomerItem.destroy_all
Customer.destroy_all
Item.destroy_all
Supermarket.destroy_all

customer_1 = Customer.create(name: "Josephine")

supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")

item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")

customer_item_1 = CustomerItem.create(customer: customer_1, item: item_1)
customer_item_2 = CustomerItem.create(customer: customer_1, item: item_2)
customer_item_3 = CustomerItem.create(customer: customer_1, item: item_3)


