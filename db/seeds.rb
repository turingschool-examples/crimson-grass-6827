# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Supermarket.destroy_all
Item.destroy_all
Customer.destroy_all
CustomersItem.destroy_all

@customer_1 = Customer.create!(name: "Willy")
@customer_2 = Customer.create!(name: "Dan")
@customer_3 = Customer.create!(name: "Shelly")
@customer_4 = Customer.create!(name: "Lily")
@kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
@target = Supermarket.create!(name: "Target", location: "Fort Colilns")
@gum = @target.items.create!(name: "Gum", price: 1)
@tomato = @kings.items.create!(name: "Tomato", price: 1)
@onion = @kings.items.create!(name: "onion", price: 1)
CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
CustomersItem.create!(customer_id: @customer_2.id, item_id: @tomato.id)
CustomersItem.create!(customer_id: @customer_3.id, item_id: @tomato.id)
CustomersItem.create!(customer_id: @customer_3.id, item_id: @onion.id)
CustomersItem.create!(customer_id: @customer_4.id, item_id: @gum.id)