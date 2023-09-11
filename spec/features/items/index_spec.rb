require 'rails_helper'

RSpec.describe "Items Index", type: :feature do
  before(:each) do
    @customer_1 = Customer.create!(name: "Willy")
    @customer_2 = Customer.create!(name: "Dan")
    @customer_3 = Customer.create!(name: "Shelly")
    @customer_4 = Customer.create!(name: "Lily")
    @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
    @tomato = @kings.items.create!(name: "Tomato", price: 1)
    @onion = @kings.items.create!(name: "onion", price: 1)
    CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_2.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_3.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_4.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_3.id, item_id: @onion.id)
    CustomersItem.create!(customer_id: @customer_4.id, item_id: @onion.id)
  end
  describe "As a visitor" do
    describe "When I visit /items" do
      it "I see a list of all items including the items name, price and supermarket it belongs to,
      as well as the count of customers that bought that item" do

        visit "/items" 
        
        within(".#{@tomato.name}") do
          expect(page).to have_content(@tomato.name)
          expect(page).to have_content("Price: #{@tomato.price}")
          expect(page).to have_content("Supermarket: #{@tomato.supermarket.name}")
          expect(page).to have_content("Purchases: 4")
        end

        within(".#{@onion.name}") do
          expect(page).to have_content(@onion.name)
          expect(page).to have_content("Price: #{@onion.price}")
          expect(page).to have_content("Supermarket: #{@onion.supermarket.name}")
          expect(page).to have_content("Purchases: 2")
        end
      end
    end
  end
end