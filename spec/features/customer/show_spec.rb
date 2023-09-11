require "rails_helper"

RSpec.describe "the customers show" do
  it "should show the customers name and a list of its items includng item name, price and name of supermarket it belongs to" do
    customer = Customer.create!(name: "Sally Shopper")
    
    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")

    item_1 = Item.create!(name: "Banana", price: 1, supermarket_id: supermarket.id)
    item_2 = Item.create!(name: "Apple", price: 2, supermarket_id: supermarket.id)
    item_3 = Item.create!(name: "Celery", price: 1, supermarket_id: supermarket.id)

    CustomerItem.create!(customer: customer, item: item_1)
    CustomerItem.create!(customer: customer, item: item_2)
    CustomerItem.create!(customer: customer, item: item_3)

    # require 'pry'; binding.pry
    visit "/customers/#{customer.id}"

    expect(page).to have_content(customer.name)
    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_1.supermarket_id)
  end
end