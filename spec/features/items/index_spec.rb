require "rails_helper"

RSpec.describe "the items index page" do
  it "lists all attributes of each item" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/items"

    expect(page).to have_content(cereal.name)
    expect(page).to have_content(cereal.price)
    expect(page).to have_content(prime_rib.name)
    expect(page).to have_content(prime_rib.price)
    


  end

  it "lists the item's associated supermarket" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    elmer = Customer.create!(name: "Elmer")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey, elmer])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/items"

    expect(page).to have_content(supermarket.name)
  end

  it "lists how many customers bought the item" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    elmer = Customer.create!(name: "Elmer")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey, elmer])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/items"

    
  end
end