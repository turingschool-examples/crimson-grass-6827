require 'rails_helper'

RSpec.describe "the customers show page", type: :feature do
  describe "As a visitor" do
    describe "When I visit customer/:id" do
      before :each do
        @supermarket1 = Supermarket.create!(name: "Supermarket 1", location: "Boulder, CO")
        @supermarket2 = Supermarket.create!(name: "Supermarket 2", location: "Boudler, CO")
        @item1 = Item.create!(name: "Milk", price: 3, supermarket_id: @supermarket1.id)
        @item2 = Item.create!(name: "Eggs", price: 1, supermarket_id: @supermarket2.id)
        @customer = Customer.create!(name: "John Smith")
        CustomerItem.create!(item: @item1, customer: @customer)
        CustomerItem.create!(item: @item2, customer: @customer)
      end

      it "I see the customer's name and a list of its items, including name, price, and supermarket" do
        visit "/customers/#{@customer.id}"

        expect(page).to have_content(@customer.name)

        within("#item-#{@item1.id}") do
          expect(page).to have_content(@item1.name)
          expect(page).to have_content(@item1.price)
          expect(page).to have_content(@supermarket1.name)
        end

        within("#item-#{@item2.id}") do
          expect(page).to have_content(@item2.name)
          expect(page).to have_content(@item2.price)
          expect(page).to have_content(@supermarket2.name)
        end
      end

      it "I see a form to add an item to this customer" do
        item3 = Item.create!(name: "Cereal", price: 2, supermarket_id: @supermarket1.id)

        visit "/customers/#{@customer.id}"

        expect(page).to have_content("Add item")

        fill_in "New Item ID:", with: item3.id
        click_button "Submit"

        expect(current_path).to eq("/customers/#{@customer.id}")

        within("#item-#{item3.id}") do
          expect(page).to have_content(item3.name)
          expect(page).to have_content(item3.price)
          expect(page).to have_content(@supermarket1.name)
        end
      end
    end
  end
end