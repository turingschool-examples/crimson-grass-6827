require "rails_helper"

RSpec.describe "the item index page" do
  it "shows a list of all items including the items name and price, the supermarket it belongs to and the count of customers that bought that item" do
    customer_1 = Customer.create(name: "Josephine")
    customer_2 = Customer.create(name: "George")
    customer_3 = Customer.create(name: "Janie")

    supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")
    item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
    item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")
    
    customer_item_1 = CustomerItem.create(customer: customer_1, item: item_1)
    customer_item_2 = CustomerItem.create(customer: customer_1, item: item_2)
    customer_item_3 = CustomerItem.create(customer: customer_1, item: item_3)

    customer_item_4 = CustomerItem.create(customer: customer_2, item: item_1)
    customer_item_5 = CustomerItem.create(customer: customer_2, item: item_2)
    customer_item_6 = CustomerItem.create(customer: customer_2, item: item_3)
    customer_item_7 = CustomerItem.create(customer: customer_3, item: item_3)

    visit "/items"

    expect(page).to have_content("Items List")

    within(".items") do
      expect(page).to have_content("Item Name: #{item_1.name}")
      expect(page).to have_content("Item Price: #{item_1.price}")
      expect(page).to have_content("Item Location: #{item_1.supermarket.name}")
      expect(page).to have_content("Number of Customers who Purchased #{item_1.name}: 2")
      expect(page).to have_content("Item Name: #{item_2.name}")
      expect(page).to have_content("Item Price: #{item_2.price}")
      expect(page).to have_content("Item Location: #{item_2.supermarket.name}")
      expect(page).to have_content("Number of Customers who Purchased #{item_2.name}: 2")
      expect(page).to have_content("Item Name: #{item_3.name}")
      expect(page).to have_content("Item Price: #{item_3.price}")
      expect(page).to have_content("Item Location: #{item_3.supermarket.name}")
      expect(page).to have_content("Number of Customers who Purchased #{item_3.name}: 3")
    end
  end
end
