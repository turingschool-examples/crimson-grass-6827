require 'rails_helper'

RSpec.describe "Items Index", type: :feature do
  before(:each) do
    @customer_1 = Customer.create!(name: "Willy")
    @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
    @tomato = @kings.items.create!(name: "Tomato", price: 1)
    @onion = @kings.items.create!(name: "onion", price: 1)
    CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
  end
  describe "As a visitor" do
    describe "When I visit /items" do
      it "I see a list of all items including the items name, price and supermarket it belongs to,
      as well as the count of customers that bought that item" do

        visit "/items" 
        
        within(".#{@tomato.name}") do
          expect(page).to have_content(@tomato.name)
          expect(page).to have_content(@tomato.price)
          expect(page).to have_content(@tomato.supermarket.name)
        end

        within(".#{@onion.name}") do
          expect(page).to have_content(@onion.name)
          expect(page).to have_content(@onion.price)
          expect(page).to have_content(@onion.supermarket.name)
        end
      end
    end
  end
end