# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@supermarket_1 = Supermarket.create(name: "Reasors", location: "Tulsa, OK")

@customer_1 = Customer.create(name: "Will")

@item_1 = @supermarket_1.items.create(name: "Banana", price: 1)
@item_2 = @supermarket_1.items.create(name: "Apple", price: 1)

@customer_item_1 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
@customer_item_2 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)
