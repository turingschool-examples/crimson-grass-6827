require "rails_helper"

RSpec.describe "Customer's show page" do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: 'Corner Market', location: '123 Food St.')
    @supermarket_2 = Supermarket.create!(name: 'HEB', location: '333  Fresh Hwy.')

    @item_1 = @supermarket_1.items.create!(name: 'Syrup', price: 3)
    @item_2 = @supermarket_1.items.create!(name: 'Bread', price: 7)
    @item_3 = @supermarket_2.items.create!(name: 'Dough', price: 4)
    @item_4 = @supermarket_1.items.create!(name: 'Suger', price: 10)

    @customer_1 = Customer.create!(name: 'Sally Shopper')
    @customer_2 = Customer.create!(name: "Bob Baker")
    @customer_3 = Customer.create!(name: "Cheif Charlie ")

    CustomerItem.create(customer: @customer_1, item: @item_1)
    CustomerItem.create(customer: @customer_1, item: @item_2)
    CustomerItem.create(customer: @customer_2, item: @item_3)
    
  end

      #   Story 1
      # As a visitor, 
      # When I visit a customer show page,
      # I see the customer's name,
      # And I see its a list of its items
      # including the item's name, price, and the name of the supermarket that it belongs to.
  describe "When I visit a customer show page" do
    it "I see the customer's name and And I see its a list of its items" do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
    end

      #       Story 2

      # As a visitor,
      # When I visit a customer's show page,
      # Then I see a form to add an item to this customer.
      # When I fill in a field with the id of an existing item,
      # And I click submit,
      # Then I am redirected back to the customer's show page, 
      # And I see the item now listed under this customer's items.
      # (You do not have to test for a sad path, for example if the ID submitted is not an existing item)
    it "Then I see a form to add an item to this customer." do
      visit "/customers/#{@customer_1.id}"

      expect(page).to have_content("Add a Item to #{@customer_1.name}")

      fill_in "item_id", with: "#{@item_4.id}"
      expect(page).to have_button("Submit")

      click_button "Submit"

      expect(current_path).to eq("/customers/#{@customer_1.id}")

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@item_1.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@item_2.price)
      expect(page).to have_content(@supermarket_1.name)
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@item_4.price)
      expect(page).to have_content(@supermarket_1.name)


    
    end
  end
end