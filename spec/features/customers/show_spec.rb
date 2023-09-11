require "rails_helper"

RSpec.describe "customers#show" do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Kroger", location: "555 Food Ave")

    @customer_1 = Customer.create!(name: "Fred")

    @item_1 = @supermarket_1.items.create!(name: "Eggs", price: 6)
    @item_2 = @supermarket_1.items.create!(name: "Banana", price: 1)
    @item_3 = @supermarket_1.items.create!(name: "Milk", price: 4)

    @eggs = CustomerItem.create!(customer: @customer_1, item: @item_1)
    @banana = CustomerItem.create!(customer: @customer_1, item: @item_2)
    @milk = CustomerItem.create!(customer: @customer_1, item: @item_3)
  end

  #   Story 1

  # As a visitor, 
  # When I visit a customer show page,
  # I see the customer's name,
  # And I see its a list of its items
  # including the item's name, price, and the name of the supermarket that it belongs to.

  describe "display customer info" do
    it "shows the customer's name" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content(@customer_1.name)
    end

    it "shows the customer's items including the item's name, price, and the name of the supermarket that it belongs to" do
      visit "/customers/#{@customer_1.id}"


      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.supermarket.name)
    end
  end


end