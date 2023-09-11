require 'rails_helper'

RSpec.describe "Customers Show", type: :feature do
  describe "As a visitor, when I visit the customer show page" do
    it "I can see the customers name, and I see a list of its items including the items name, price and the name of the supermarket it belongs to" do

      @supermarket_1 = Supermarket.create(name: "Reasors", location: "Tulsa, OK")

      @customer_1 = Customer.create(name: "Will")

      @item_1 = @supermarket_1.items.create(name: "Banana", price: 1)
      @item_2 = @supermarket_1.items.create(name: "Apple", price: 0.50)

      @customer_item_1 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
      @customer_item_2 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)

      visit "customers/#{@customer_1.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
    end
  end
end
