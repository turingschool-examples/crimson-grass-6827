# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@corner = Supermarket.create!(name: "Corner Market", location: "123 Food St.")
    @fresh = Supermarket.create!(name: "Super Fresh", location: "456 Farm Rd.")

    @cheese = Item.create!( name: "Cheese",price: 4, supermarket_id: @corner.id )
    @milk = Item.create!( name: "Milk",price: 3, supermarket_id: @corner.id )
    @eggs = Item.create!( name: "Eggs",price: 7, supermarket_id: @corner.id )
    @mushrooms = Item.create!( name: "Mushrooms",price: 5, supermarket_id: @corner.id )
    @onion = Item.create!( name: "Onions",price: 2, supermarket_id: @fresh.id )
    @truff = Item.create!( name: "Truffles",price: 34, supermarket_id: @fresh.id )
    @crab = Item.create!( name: "Lump Crab Meat",price: 17, supermarket_id: @fresh.id )

    @sally = Customer.create!( name: "Sally Shopper")
    @bill = Customer.create!( name: "Bill Buyer")

    CustomerItem.create!(item_id: @cheese.id, customer_id: @sally.id)
    CustomerItem.create!(item_id: @eggs.id, customer_id: @sally.id)
    CustomerItem.create!(item_id: @mushrooms.id, customer_id: @sally.id)
    CustomerItem.create!(item_id: @onion.id, customer_id: @sally.id)

    CustomerItem.create!(item_id: @crab.id, customer_id: @bill.id)
    CustomerItem.create!(item_id: @milk.id, customer_id: @bill.id)
    CustomerItem.create!(item_id: @onion.id, customer_id: @bill.id)
    CustomerItem.create!(item_id: @truff.id, customer_id: @bill.id)