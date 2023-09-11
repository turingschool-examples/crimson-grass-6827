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

#supermarket
@supermarket_1 = Supermarket.create!(name: "Kroger", location: "555 Food Ave")

#customer
@customer_1 = Customer.create!(name: "Fred")

#item
@item_1 = @supermarket_1.items.create!(name: "Eggs", price: 6)
@item_2 = @supermarket_1.items.create!(name: "Banana", price: 1)
@item_3 = @supermarket_1.items.create!(name: "Milk", price: 4)
@item_4 = @supermarket_1.items.create!(name: "Walnuts", price: 5)

#customer item
@eggs = CustomerItem.create!(customer: @customer_1, item: @item_1)
@banana = CustomerItem.create!(customer: @customer_1, item: @item_2)
@milk = CustomerItem.create!(customer: @customer_1, item: @item_3)