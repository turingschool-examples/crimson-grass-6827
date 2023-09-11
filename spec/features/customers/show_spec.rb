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

  it "shows a form to add an item with an existing id to the customer's items. It then redirects me back to the show page where I see that item listed." do
    customer_1 = Customer.create(name: "Josephine")

    supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")
    item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
    item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")
    item_4 = Item.create(name: "spinach", price: 1, supermarket_id: "#{supermarket_1.id}")
    item_5 = Item.create(name: "bread", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_6 = Item.create(name: "apricots", price: 4, supermarket_id: "#{supermarket_1.id}")
    
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
    
    within(".add_item") do
      expect(page).to have_content("Add Item:")
      fill_in "new_item_id", with: "#{item_4.id}"
      click_button "Save"
      expect(page).to have_current_path("/customers/#{customer_1.id}")
    end
    
    within(".items") do
      expect(page).to have_content("Item Name: #{item_4.name}")
      expect(page).to have_content("Item Price: #{item_4.price}")
      expect(page).to have_content("Item Location: #{item_4.supermarket.name}")
    end
  end
end
