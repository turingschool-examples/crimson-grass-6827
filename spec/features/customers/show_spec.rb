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

    save_and_open_page

    expect(page).to have_content(prime_rib.name)
    expect(page).to have_content(prime_rib.price)
    expect(page).to have_content(supermarket.name)

  end
end