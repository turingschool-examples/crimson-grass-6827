require "rails_helper"

RSpec.describe "supermarkets#show" do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Kroger", location: "555 Food Ave")

    @customer_1 = Customer.create!(name: "Fred")
    @customer_2 = Customer.create!(name: "Creedence")
    @customer_3 = Customer.create!(name: "Jane")

    @item_1 = @supermarket_1.items.create!(name: "Eggs", price: 6)
    @item_2 = @supermarket_1.items.create!(name: "Banana", price: 1)
    @item_3 = @supermarket_1.items.create!(name: "Milk", price: 4)
    @item_4 = @supermarket_1.items.create!(name: "Walnuts", price: 5)

    @eggs_1 = CustomerItem.create!(customer: @customer_1, item: @item_1)
    @eggs_2 = CustomerItem.create!(customer: @customer_2, item: @item_1)
    @banana = CustomerItem.create!(customer: @customer_1, item: @item_2)
    @milk_1 = CustomerItem.create!(customer: @customer_1, item: @item_3)
    @milk_2 = CustomerItem.create!(customer: @customer_3, item: @item_3)

  end

    #   Extension

    # As a visitor,
    # When I visit a supermarket's show page,
    # Then I see a unique list of all customers that have shopped at the supermarket.

  describe "supermarket customers list" do
    it "shows all the customers that have shopped at the supermarket" do
      visit "/supermarkets/#{@supermarket_1.id}"

      expect(page).to have_content(@customer_1)

    end
  end
end
