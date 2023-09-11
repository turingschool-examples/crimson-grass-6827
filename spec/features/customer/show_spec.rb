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
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
    expect(page).to have_content(item_2.supermarket_id)
    
    # save_and_open_page
  end

  it "When I visit a customer's show page, Then I see a form to add an item to this customer" do
    customer = Customer.create!(name: "Sally Shopper")

    supermarket = Supermarket.create!(name: "Corner Market", location: "123 Food St.")

    item_1 = Item.create!(name: "Banana", price: 1, supermarket_id: supermarket.id)
    item_2 = Item.create!(name: "Apple", price: 2, supermarket_id: supermarket.id)
    item_3 = Item.create!(name: "Celery", price: 1, supermarket_id: supermarket.id)
    item_4 = Item.create!(name: "Bacon", price: 4, supermarket_id: supermarket.id
    )
    CustomerItem.create!(customer: customer, item: item_1)
    CustomerItem.create!(customer: customer, item: item_2)
    CustomerItem.create!(customer: customer, item: item_3)
    # require 'pry'; binding.pry

    visit "/customers/#{customer.id}"

    expect(page).to have_content("Add an item to this list")
    expect(page).to have_field("Search by item ID:")
    expect(page).to have_button("Submit")
  end

  it "when I fill in the field with an ID of an item and click submit, I should be redirected back to the show page and the item should be listed under the customer" do

    visit "/customers/#{customer.id}"
    fill_in "Search by item ID:", with: "130"
    click_button("Submit")

    expect(current_path).to eq("/customers/#{customer.id}")
    expect(page).to have_content(item_4.name)
  end

end