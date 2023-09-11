require 'rails_helper'

RSpec.describe "the supermarkets show page", type: :feature do
  describe "As a visitor" do
    describe "When I visit /supermarkets/:id" do
      it "I see a unique list of all customers that have shopped at the supermarket" do
        supermarket = Supermarket.create!(name: "Supermarket 1", location: "Boulder, CO")
        item1 = Item.create!(name: "Milk", price: 3, supermarket_id: supermarket.id)
        item2 = Item.create!(name: "Eggs", price: 1, supermarket_id: supermarket.id)
        customer1 = Customer.create!(name: "John Smith")
        customer2 = Customer.create!(name: "Jane Doe")
        customer3 = Customer.create!(name: "Joe Person")
        CustomerItem.create!(item: item1, customer: customer1)
        CustomerItem.create!(item: item2, customer: customer1)
        CustomerItem.create!(item: item2, customer: customer2)
        CustomerItem.create!(item: item2, customer: customer3)

        visit "/supermarkets/#{supermarket.id}"

        expect(page).to have_content(customer1.name, count: 1)
        expect(page).to have_content(customer2.name)
        expect(page).to have_content(customer3.name)
      end
    end 
  end
end