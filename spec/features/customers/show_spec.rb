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

        CustomerItems.create!(customer: customer_1, item: banana)
        CustomerItems.create!(customer: customer_1, item: apple)

        visit "/customers/#{customer_1.id}"

        expect(page).to have_content("Sally Shopper")
        
        expect(page).to have_content("Items:")
        expect(page).to have_content("Name: #{banana.name} | Price: #{banana.price} | Supermarket: #{supermarket_1.name}")
        expect(page).to have_content("Name: #{apple.name} | Price: #{apple.price} | Supermarket: #{supermarket_1.name}")
      end
    end
  end
end