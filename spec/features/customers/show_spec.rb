require "rails_helper"

RSpec.describe "Customers Show Page", type: :feature do
  before :each do
    @michael_phelps = Customer.create!(name: "Michael Phelps")

    @sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

    @bananas = @sprouts.items.create!(name: "Bananas", price: 1)
    @apples = @sprouts.items.create!(name: "Apples", price: 2)
    @oranges = @sprouts.items.create!(name: "Oranges", price: 3)
    @peaches = @sprouts.items.create!(name: "Peaches", price: 4)

    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @bananas.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @oranges.id)
  end

  describe "As a visitor" do
    describe "When I visit a customer show page" do
      it "displays the customers name, and I see a list of its items, including the items name, price, and the name of the supermarket that it belongs to" do
        visit "/customers/#{@michael_phelps.id}"

        expect(page).to have_content("Customer: #{@michael_phelps.name}")
        expect(page).to have_content("#{@michael_phelps.name}'s Items:")
        expect(page).to have_content("#{@bananas.name}, Price: $#{@bananas.price}, Supermarket: #{@sprouts.name}")
        expect(page).to have_content("#{@apples.name}, Price: $#{@apples.price}, Supermarket: #{@sprouts.name}")
        expect(page).to have_content("#{@oranges.name}, Price: $#{@oranges.price}, Supermarket: #{@sprouts.name}")
      end

      it "displays a form to add an item to this customer" do
        visit "/customers/#{@michael_phelps.id}"

        expect(page).to have_content("Add an item to this customer:")
        expect(page).to have_button("Submit")
      end

      describe "When I fill in a field with the id of an existing item and I click submit" do
        it "redirects me back to the customers show page and I see the item now listed under this customers items" do
          visit "/customers/#{@michael_phelps.id}"

          expect(page).to_not have_content("#{@peaches.name}")

          fill_in :item_id, with: @peaches.id

          click_on "Submit"

          expect(current_path).to eq("/customers/#{@michael_phelps.id}")

          expect(page).to have_content("#{@peaches.name}, Price: $#{@peaches.price}, Supermarket: #{@sprouts.name}")
        end
      end
    end
  end
end