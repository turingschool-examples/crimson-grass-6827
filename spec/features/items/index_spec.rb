require "rails_helper"

RSpec.describe "the item index" do
  it "shows items detail and customer count" do
    customer_1 = Customer.create(name:"Bob")
    customer_2 = Customer.create(name:"Dave")
    customer_3 = Customer.create(name:"Steve")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    customer_1.add_item(item_1.id)
    customer_2.add_item(item_2.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)

    visit ("/items") 

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_3.price)
    expect(page).to have_content(supermarket_1.name)
    expect(page).to have_content(3)
  end
end