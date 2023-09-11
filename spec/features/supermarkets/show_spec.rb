require 'rails_helper'

RSpec.describe "Supermarkets Show", type: :feature do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
    @item_1 = @supermarket_1.items.create!(name: "Tuna", price: 2)
    @item_2 = @supermarket_1.items.create!(name: "Red Snapper", price: 5)
    @item_3 = @supermarket_1.items.create!(name: "Salmon", price: 3)
    @customer_1 = Customer.create!(name: "Tyler")
    @customer_2 = Customer.create!(name: "Kiwi")
    @customer_3 = Customer.create!(name: "Chicken")
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_2.id)
    CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
  end

  describe "When I visit the supermarkets show page" do
    it "I see a unique list of all customers that have shopped at that supermarket" do
      visit "/supermarkets/#{@supermarket_1.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@customer_2.name)
      expect(page).to_not have_content(@customer_3.name)
    end
  end
end