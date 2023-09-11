require "rails_helper"

RSpec.describe "Items index page" do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: 'Corner Market', location: '123 Food St.')
    @supermarket_2 = Supermarket.create!(name: 'HEB', location: '333  Fresh Hwy.')

    @item_1 = @supermarket_1.items.create!(name: 'Syrup', price: 3)
    @item_2 = @supermarket_1.items.create!(name: 'Bread', price: 7)
    @item_3 = @supermarket_2.items.create!(name: 'Dough', price: 4)
    @item_4 = @supermarket_2.items.create!(name: 'Suger', price: 10)

    @customer_1 = Customer.create!(name: 'Sally Shopper')
    @customer_2 = Customer.create!(name: "Bob Baker")
    @customer_3 = Customer.create!(name: "Cheif Charlie ")

    CustomerItem.create(customer: @customer_1, item: @item_1)
    CustomerItem.create(customer: @customer_1, item: @item_2)
    CustomerItem.create(customer: @customer_2, item: @item_1)
    CustomerItem.create(customer: @customer_1, item: @item_4)
    CustomerItem.create(customer: @customer_2, item: @item_4)
    
  end

      # Story 3

      # As a visitor,
      # When I visit the items index page,
      # Then I see a list of all items
      # including the item's name, price, and the name of the supermarket that it belongs to
      # and the count of customers that bought that item.
  describe "When I visit the items index page," do
    it "Then I see a list of all items" do
      visit "/items"

      save_and_open_page
    
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@customer_1.name)

      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@customer_1.name)

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_2.name)
      expect(page).to have_content(@customer_2.name)

      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_2.name)
    end
  end
end