require "rails_helper"

RSpec.describe "Customers Show" do 
  describe "as a visitor" do 
    before(:each) do
      @supermarket_1 = Supermarket.create!(name: "Sprouts", location: "CO")

      @item_1 = @supermarket_1.items.create!(name: "Beef", price: 5)
      @item_2 = @supermarket_1.items.create!(name: "Cheese", price: 3)
      @item_3 = @supermarket_1.items.create!(name: "Soup", price: 2)

      @customer_1 = Customer.create!(name: "Aaron")
      @customer_2 = Customer.create!(name: "Chase")

      CustomerItems.create!(customer: @customer_1, item: @item_1)
      CustomerItems.create!(customer: @customer_1, item: @item_2)
      CustomerItems.create!(customer: @customer_2, item: @item_2)
      CustomerItems.create!(customer: @customer_2, item: @item_3)
    end

    # User Story 1
    it "displays customer's name and list of customer's items with attributes" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content("Name: #{@customer_1.name}")

      within(".items-list") do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@item_1.supermarket.name)
      end
    end
  end
end