require 'rails_helper'

RSpec.describe "Customers Show" do
  before(:each) do
    @customer_1 = Customer.create!(name: "Tyler")
    @supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
    @item_1 = @supermarket_1.items.create!(name: "Tuna", price: 2)
    @item_2 = @supermarket_1.items.create!(name: "Red Snapper", price: 5)
    @item_3 = @supermarket_1.items.create!(name: "Salmon", price: 3)
    CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
    CustomerItem.create!(item_id: @item_3.id, customer_id: @customer_1.id)
  end

  describe "When I visit a customers show page" do
    it "I see the customers name" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content("Tyler")
    end

    it "I see the customers items, including name, price, and the supermarket it belongs to" do
      visit "/customers/#{@customer_1.id}"
      
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content("$#{@item_1.price}")
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content("$#{@item_3.price}")
      expect(page).to have_content("found at: #{@supermarket_1.name}")
    end

    it "I see a form to add a new item to the customers" do
      visit "/customers/#{@customer_1.id}"
      
      expect(page).to have_field("item_id")
      expect(page).to have_button("Add Item")
    end

    it "Filling the form with an existing item id and submitting it redirects me to the same page and shows the added item" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to_not have_content(@item_2.name)
      expect(page).to_not have_content(@item_2.price)
      
      fill_in("item_id", with: "#{@item_2.id}")
      click_button("Add Item")

      expect(page).to have_current_path("/customers/#{@customer_1.id}")
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)

      save_and_open_page
    end
  end
end