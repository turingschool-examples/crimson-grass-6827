require "rails_helper"

RSpec.describe Customer, type: :feature do
  before(:each) do
    @supermarket = Supermarket.create(name: "Whole Foods", location: "124 Wall St.")
    @customer = Customer.create(name: "John Dwayne")
    @item1 = @customer.items.create(name: "Banana", price: 20)
  end

  it "As a visitor, When I visit a customer show page, I see the customer's name, And I see its a list of its items including the item's name, price, and the name of the supermarket that it belongs to." do
    visit "/customers/#{@customer.id}"
    expect(page).to have_content(@customer.name)
    expect(page).to have_content(@item1.name)
    expect(page).to have_content(@item1.price)
    expect(page).to have_content(@supermarket.name)
  end
end