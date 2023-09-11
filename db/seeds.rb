# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CustomerItem.destroy_all
Item.destroy_all
Supermarket.destroy_all
Customer.destroy_all

kings = Supermarket.create(name: 'Kings', location: '123 main st')
safeway = Supermarket.create(name: 'Safeway', location: '5678 water ln')

customer1 = Customer.create(name: 'Bob')
customer2 = Customer.create(name: 'Lisa')

bread = Item.create(name: 'Bread', price: 3, supermarket: kings)
eggs = Item.create(name: 'Eggs', price: 2, supermarket: kings)
milk = Item.create(name: 'Milk', price: 5, supermarket: safeway)

CustomerItem.create(customer: customer1, item: bread)
CustomerItem.create(customer: customer1, item: eggs)
CustomerItem.create(customer: customer2, item: eggs)
CustomerItem.create(customer: customer2, item: milk)






