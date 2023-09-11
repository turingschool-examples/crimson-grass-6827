require "rails_helper"

RSpec.describe "Customer Show",type: :feature do
  describe "as a visitor" do
    describe "when I visit a customer show page" do
      it "I see the customer's name, a list of its items including the item's name, price, and the name of the supermarket that it belongs to" do
        customer_1 = Customer.create!(name: "Sally Shopper")

        supermarket_1 = Supermarket.create!(
          name: "Corner Market",
          location: "123 Food Street"
        )

        banana = supermarket_1.items.create!(
          name: "Banana",
          price: 1
        )

        apple = supermarket_1.items.create!(
          name: "Apple",
          price: 2
        )

        CustomerItem.create!(customer: customer_1, item: banana)
        CustomerItem.create!(customer: customer_1, item: apple)

        visit "/customers/#{customer_1.id}"

        expect(page).to have_content("Sally Shopper")
        
        expect(page).to have_content("Items:")
        expect(page).to have_content("Name: #{banana.name} | Price: #{banana.price} | Supermarket: #{supermarket_1.name}")
        expect(page).to have_content("Name: #{apple.name} | Price: #{apple.price} | Supermarket: #{supermarket_1.name}")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit a customer's show page" do
      describe "I see a form to add an item to this customer" do
        describe "when I fill in a field with the id of an existing item, and I click submit" do
          it "I am redirected back to the customer's show page, and I see the item now listed under this customer's items" do
            customer_1 = Customer.create!(name: "Sally Shopper")

            supermarket_1 = Supermarket.create!(
              name: "Corner Market",
              location: "123 Food Street"
            )

            banana = supermarket_1.items.create!(
              name: "Banana",
              price: 1
            )

            apple = supermarket_1.items.create!(
              name: "Apple",
              price: 2
            )

            CustomerItem.create!(customer: customer_1, item: banana)

            visit "/customers/#{customer_1.id}"

            expect(page).to have_content("Add item by item ID:")
            expect(page).to have_button("Submit")
            
            fill_in "Add item by item ID:", with: "#{apple.id}"

            click_button "Submit"

            expect(current_path).to eq("/customers/#{customer_1.id}")

            within("#items") do
              expect(page).to have_content("Name: #{apple.name} | Price: #{apple.price} | Supermarket: #{supermarket_1.name}")
            end
          end
        end
      end
    end
  end
end