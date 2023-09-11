will = Customer.create(name: "Will")
stephen = Customer.create(name: "Stephen")

soopers = Supermarket.create(name: "Soopers", location: "Denver")
costco = Supermarket.create(name: "Costco", location: "Arvada")

cereal = soopers.items.create(name: "Cereal", price: 5)
milk = soopers.items.create(name: "Milk", price: 3)

steak = costco.items.create(name: "Steak", price: 10)
fries = costco.items.create(name: "Fries", price: 2)

will.items << steak
will.items << fries

stephen.items << cereal
stephen.items << milk