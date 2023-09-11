require "rails_helper"

RSpec.describe "the customer show page" do
  it "shows the customer's name and a list of items, including name and price, and also supermarket it belongs to" do
    customer_1 = Customer.create(name: "Josephine")

    supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")
    item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
    item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")
    
    customer_item_1 = CustomerItem.create(customer: customer_1, item: item_1)
    customer_item_2 = CustomerItem.create(customer: customer_1, item: item_2)
    customer_item_3 = CustomerItem.create(customer: customer_1, item: item_3)

    visit "/customers/#{customer_1.id}"

    expect(page).to have_content("Customer Name: Josephine")
    
    within(".items") do
      expect(page).to have_content("Customer Items:")
      expect(page).to have_content("Item Name: #{item_1.name}")
      expect(page).to have_content("Item Price: #{item_1.price}")
      expect(page).to have_content("Item Location: #{item_1.supermarket.name}")
      expect(page).to have_content("Item Name: #{item_2.name}")
      expect(page).to have_content("Item Price: #{item_2.price}")
      expect(page).to have_content("Item Location: #{item_2.supermarket.name}")
      expect(page).to have_content("Item Name: #{item_3.name}")
      expect(page).to have_content("Item Price: #{item_3.price}")
      expect(page).to have_content("Item Location: #{item_3.supermarket.name}")
    end
  end
end
