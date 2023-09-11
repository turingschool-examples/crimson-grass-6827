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

  # xit "displays the list of items they intend to buy and what supermarket they are from" do

  # end
end