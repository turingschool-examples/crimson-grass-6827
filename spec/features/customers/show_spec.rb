require "rails_helper"

RSpec.describe "customer show page" do
  it "displays the customer and all of their items" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/customers/#{corey.id}"

    expect(page).to have_content(corey.name)
    expect(page).to have_content(cereal.name)
    expect(page).to have_content(prime_rib.name)

  end

  it "displays all information about each item" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/customers/#{corey.id}"


    expect(page).to have_content(prime_rib.name)
    expect(page).to have_content(prime_rib.price)
    expect(page).to have_content(supermarket.name)
  end

  it "shows a form to add new items" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    visit "/customers/#{corey.id}"

    expect(page).to have_button("Submit")
  end

  it "can add new items to a customer" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])
    dog_food = supermarket.items.create!(name: "Prime Rib", price: 8, customers: [])

    visit "/customers/#{corey.id}"

    fill_in( :item_id, with: dog_food.id)
    click_button("Submit")

    expect(page).to have_content(dog_food.name)
    expect(page).to have_content(dog_food.price)
  end
end