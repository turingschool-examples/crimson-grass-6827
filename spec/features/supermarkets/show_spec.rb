require "rails_helper"

RSpec.describe "Supermarket Show", type: :feature do
  describe "as a visitor" do
    describe "when I visit a supermarket's show page" do
      it "I see a unique list of all customers that have shopped at the supermarket" do
        customer_1 = Customer.create!(name: "Sally Shopper")
        customer_2 = Customer.create!(name: "Billy Buyer")
        customer_3 = Customer.create!(name: "Willy Wanter")

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

        orange = supermarket_1.items.create!(
          name: "Orange",
          price: 3
        )

        CustomerItem.create!(customer: customer_1, item: banana)
        CustomerItem.create!(customer: customer_1, item: apple)
        CustomerItem.create!(customer: customer_1, item: orange)
        
        CustomerItem.create!(customer: customer_2, item: apple)
        CustomerItem.create!(customer: customer_2, item: orange)

        visit "/supermarkets/#{supermarket_1.id}"

        expect(page).to have_content("Customers that have shopped here:")
        expect(page).to have_content("#{customer_1.name}")
        expect(page).to have_content("#{customer_2.name}")
        expect(page).not_to have_content("#{customer_3.name}")
      end
    end
  end
end