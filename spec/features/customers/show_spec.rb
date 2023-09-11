require "rails_helper"

RSpec.describe "the custmer show page" do
  it "displays the name of customer" do
    market1 = Supermarket.create(name: "Supermercado", location: "123 Food St.")
    item1 = market1.items.create(name: "Banana", price: 1)
    item2 = market1.items.create(name: "Coffee", price: 3)
    item3 = market1.items.create(name: "Pasta", price: 3)
    customer1 = Customer.create(name: "Guy")
    visit "/customers/#{customer1.id}"

    expect(page).to have_content("#{customer1.name}'s Shopping List")
  end

  it "displays the list of items they intend to buy and what supermarket they are from" do
    market1 = Supermarket.create(name: "Supermercado", location: "123 Food St.")
    item1 = market1.items.create(name: "Banana", price: 1)
    item2 = market1.items.create(name: "Coffee", price: 3)
    item3 = market1.items.create(name: "Pasta", price: 3)
    customer1 = Customer.create(name: "Guy")
    customer_item1 = CustomerItem.create(item: item1, customer: customer1)
    customer_item2 = CustomerItem.create(item: item2, customer: customer1)
    customer_item3 = CustomerItem.create(item: item3, customer: customer1)
    visit "/customers/#{customer1.id}"

    within("div.grocery-list") do
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.price)
      expect(page).to have_content(item1.supermarket.name)
      expect(page).to have_content(item2.name)
      expect(page).to have_content(item2.price)
      expect(page).to have_content(item2.supermarket.name)
      expect(page).to have_content(item3.name)
      expect(page).to have_content(item3.price)
      expect(page).to have_content(item3.supermarket.name)
    end
  end
end