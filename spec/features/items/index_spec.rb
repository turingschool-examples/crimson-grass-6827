require 'rails_helper'

RSpec.describe "Items Index", type: :feature do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
    @item_1 = @supermarket_1.items.create!(name: "Tuna", price: 2)
    @item_2 = @supermarket_1.items.create!(name: "Red Snapper", price: 5)
    @item_3 = @supermarket_1.items.create!(name: "Salmon", price: 3)
    @customer_1 = Customer.create!(name: "Tyler")
    @customer_2 = Customer.create!(name: "Kiwi")
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_2.id)
    CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
  end

  describe "When I visit the items index page" do
    it "I see a list of all items including their name, price, supermarket, and the count of customers that bought it" do
      visit "/items"

      within("#item-#{@item_1.id}") do
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_1.price)
        expect(page).to have_content(@supermarket_1.name)
        expect(page).to have_content("Items purchased: 2")
      end

      within("#item-#{@item_2.id}") do
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_2.price)
        expect(page).to have_content(@supermarket_1.name)
        expect(page).to have_content("Items purchased: 1")
      end

      within("#item-#{@item_3.id}") do
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_3.price)
        expect(page).to have_content(@supermarket_1.name)
        expect(page).to have_content("Items purchased: 0")
      end
    end
  end
end