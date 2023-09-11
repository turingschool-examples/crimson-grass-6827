require "rails_helper"

RSpec.describe "the customer show" do
  it "shows customer and items" do
    customer = Customer.create(name:"Bob")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    customer.add_item(item_1.id)
    customer.add_item(item_2.id)
    customer.add_item(item_3.id)

    visit ("/customers/#{customer.id}") 

    expect(page).to have_content(customer.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_3.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_3.price)
    expect(page).to have_content(supermarket_1.name)
  end

  it "add item to customer" do
    customer = Customer.create(name:"Bob")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    # customer.add_item(item_1.id)
    # customer.add_item(item_2.id)
    # customer.add_item(item_3.id)

    visit ("/customers/#{customer.id}") 
    fill_in "id", with: "#{item_1.id}"
    click_button "Add Item"

    expect(page).to have_content(customer.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
  end
end