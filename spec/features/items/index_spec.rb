require "rails_helper"

RSpec.describe "items#index" do
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
    # @walnuts = CustomerItem.create!(customer: @customer_1, item: @item_4)
  end
    # Story 3

    # As a visitor,
    # When I visit the items index page,
    # Then I see a list of all items
    # including the item's name, price, and the name of the supermarket that it belongs to
    # and the count of customers that bought that item.

    it "displays all items and their attributes" do
      visit "/items"

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.supermarket.name)
      expect(page).to have_content(@item_1.customer_count)

      expect(page).to have_content("Name: #{@item_2.name}")
      expect(page).to have_content("Price: #{@item_2.price}")
      expect(page).to have_content("Supermarket: #{@item_2.supermarket.name}")
      expect(page).to have_content("Customers Count: #{@item_2.customer_count}")

      # hard coding customers count to check that both instances of item_3 
      # aka milk show up 2 times
      expect(page).to have_content("Name: #{@item_3.name}")
      expect(page).to have_content("Price: #{@item_3.price}")
      expect(page).to have_content("Supermarket: #{@item_3.supermarket.name}")
      expect(page).to have_content("Customers Count: 2")
      
      # testing to see that items can be bought by no customers and still appear
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content("Price: #{@item_4.price}")
      expect(page).to have_content(@item_4.supermarket.name)
      expect(page).to have_content("Customers Count: 0")
    end

end