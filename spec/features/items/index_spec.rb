require 'rails_helper'

require 'rails_helper'

RSpec.describe "Items Index", type: :feature do
  describe "As a visitor, when I visit the Items Index page" do
    it "I can see a list of items with their name, price, supermarket name, and count of customers who bought that item" do
      @supermarket_1 = Supermarket.create(name: "Reasors", location: "Tulsa, OK")
      @supermarket_2 = Supermarket.create(name: "Whole Foods", location: "Tulsa, OK")
      @customer_1 = Customer.create(name: "Will")
      @customer_2 = Customer.create(name: "Dee")
      @item_1 = @supermarket_1.items.create(name: "Banana", price: 1)
      @item_2 = @supermarket_1.items.create(name: "Apple", price: 1)
      @item_3 = @supermarket_2.items.create(name: "Cilantro", price: 1)
      @item_4 = @supermarket_2.items.create(name: "Eggs", price: 2)
      @customer_item_1 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_1.id)
      @customer_item_2 = CustomerItem.create(customer_id: @customer_1.id, item_id: @item_2.id)
      @customer_item_3 = CustomerItem.create(customer_id: @customer_2.id, item_id: @item_3.id)
      @customer_item_4 = CustomerItem.create(customer_id: @customer_2.id, item_id: @item_4.id)

      visit '/items'

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_1.customers.count)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_2.customers.count)
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@item_3.price)
      expect(page).to have_content(@supermarket_2.name)
      expect(page).to have_content(@item_3.customers.count)
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@item_4.price)
      expect(page).to have_content(@supermarket_2.name)
      expect(page).to have_content(@item_4.customers.count)

    end
  end
end