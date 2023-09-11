require "rails_helper"

RSpec.describe "Items Index", type: :feature do
  describe "as a visitor" do
    describe "when I visit the items index page" do
      it "I see a list of all items including the item's name, price, and the name of the supermarket that it belongs to and the count of customers that bought that item" do
        customer_1 = Customer.create!(name: "Sally Shopper")

        customer_2 = Customer.create!(name: "Billy Buyer")

        supermarket_1 = Supermarket.create!(
          name: "Corner Market",
          location: "123 Food Street"
        )

        supermarket_2 = Supermarket.create!(
          name: "Triangle Market",
          location: "234 Food Street"
        )

        banana = supermarket_1.items.create!(
          name: "Banana",
          price: 1
        )

        apple = supermarket_1.items.create!(
          name: "Apple",
          price: 2
        )

        orange = supermarket_2.items.create!(
          name: "Orange",
          price: 3
        )

        CustomerItem.create!(customer: customer_1, item: banana)
        CustomerItem.create!(customer: customer_1, item: apple)
        
        CustomerItem.create!(customer: customer_2, item: apple)
        CustomerItem.create!(customer: customer_2, item: orange)

        visit "/items"

        within("item_#{banana.id}") do
          expect(page).to have_content("#{banana.name}")
          expect(page).to have_content("Price: $#{banana.price}")
          expect(page).to have_content("Supermarket: #{banana.supermarket.name}")
          expect(page).to have_content("Count of customers that have bought this item: 1")
        end

        within("item_#{apple.id}") do
          expect(page).to have_content("#{apple.name}")
          expect(page).to have_content("Price: $#{apple.price}")
          expect(page).to have_content("Supermarket: #{apple.supermarket.name}")
          expect(page).to have_content("Count of customers that have bought this item: 2")
        end

        within("item_#{orange.id}") do
          expect(page).to have_content("#{orange.name}")
          expect(page).to have_content("Price: $#{orange.price}")
          expect(page).to have_content("Supermarket: #{orange.supermarket.name}")
          expect(page).to have_content("Count of customers that have bought this item: 1")
        end
      end
    end
  end
end