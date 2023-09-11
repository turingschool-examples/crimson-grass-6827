require "rails_helper"

RSpec.describe "customers#show" do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "Kroger", location: "555 Food Ave")

    @customer_1 = Customer.create!(name: "Fred")

    @item_1 = @supermarket_1.items.create!(name: "Eggs", price: 6)
    @item_2 = @supermarket_1.items.create!(name: "Banana", price: 1)
    @item_3 = @supermarket_1.items.create!(name: "Milk", price: 4)
    @item_4 = @supermarket_1.items.create!(name: "Walnuts", price: 5)

    @eggs = CustomerItem.create!(customer: @customer_1, item: @item_1)
    @banana = CustomerItem.create!(customer: @customer_1, item: @item_2)
    @milk = CustomerItem.create!(customer: @customer_1, item: @item_3)
    # @walnuts = CustomerItem.create!(customer: @customer_1, item: @item_4)
  end

  #   Story 1

  # As a visitor, 
  # When I visit a customer show page,
  # I see the customer's name,
  # And I see its a list of its items
  # including the item's name, price, and the name of the supermarket that it belongs to.

  describe "display customer info" do
    it "shows the customer's name" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content(@customer_1.name)
    end

    it "shows the customer's items including the item's name, price, and the name of the supermarket that it belongs to" do
      visit "/customers/#{@customer_1.id}"


      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@item_1.supermarket.name)
    end
  end
  # Story 2

  # As a visitor,
  # When I visit a customer's show page,
  # Then I see a form to add an item to this customer.
  # When I fill in a field with the id of an existing item,
  # And I click submit,
  # Then I am redirected back to the customer's show page, 
  # And I see the item now listed under this customer's items.
  # (You do not have to test for a sad path, for example if the ID submitted is not an existing item)

  describe "has a form to add an item to the customer" do
    it "can add another item to the customers list of items with a submit button" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to_not have_content(@item_4.name)

      fill_in :item_id, with: @item_4.id

      click_button "Submit"

      expect(current_path).to eq("/customers/#{@customer_1.id}")
      expect(page).to have_content(@item_4.name)
    end
  end
end