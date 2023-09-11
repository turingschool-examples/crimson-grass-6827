require 'rails_helper'

RSpec.describe "the items index page", type: :feature do
  describe "As a visitor" do
    describe "When I visit /items" do
      before :each do
        @supermarket1 = Supermarket.create!(name: "Supermarket 1", location: "Boulder, CO")
        @supermarket2 = Supermarket.create!(name: "Supermarket 2", location: "Boudler, CO")
        @item1 = Item.create!(name: "Milk", price: 3, supermarket_id: @supermarket1.id)
        @item2 = Item.create!(name: "Eggs", price: 1, supermarket_id: @supermarket2.id)
        @customer1 = Customer.create!(name: "John Smith")
        @customer2 = Customer.create!(name: "Jane Doe")
        CustomerItem.create!(item: @item1, customer: @customer1)
        CustomerItem.create!(item: @item2, customer: @customer1)
        CustomerItem.create!(item: @item1, customer: @customer2)
      end
      
      it "I see a list of all items, including name, price, and supermarket, and the count of customers that bought it" do
        visit "/items"

        within("#item-#{@item1.id}") do
          expect(page).to have_content(@item1.name)
          expect(page).to have_content(@item1.price)
          expect(page).to have_content(@supermarket1.name)
          expect(page).to have_content(@item1.customer_count)
        end

        within("#item-#{@item2.id}") do
          expect(page).to have_content(@item2.name)
          expect(page).to have_content(@item2.price)
          expect(page).to have_content(@supermarket2.name)
          expect(page).to have_content(@item2.customer_count)
        end
      end
    end
  end
end
