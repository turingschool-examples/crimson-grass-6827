require "rails_helper"

RSpec.describe "the supermarket show page" do
  it "shows a unique list of all customers that have shopped at that location" do
    customer_1 = Customer.create(name: "Josephine")
    customer_2 = Customer.create(name: "George")
    customer_3 = Customer.create(name: "Janie")

    supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")
    item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
    item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")
    item_4 = Item.create(name: "spinach", price: 1, supermarket_id: "#{supermarket_1.id}")
    item_5 = Item.create(name: "bread", price: 3, supermarket_id: "#{supermarket_1.id}")
    item_6 = Item.create(name: "apricots", price: 4, supermarket_id: "#{supermarket_1.id}")
    
    customer_item_1 = CustomerItem.create(customer: customer_1, item: item_1)
    customer_item_4 = CustomerItem.create(customer: customer_2, item: item_1)
    customer_item_7 = CustomerItem.create(customer: customer_3, item: item_3)

    visit "/supermarkets/#{supermarket_1.id}"

    expect(page).to have_content("Supermarket Name: Albertson's")

    within(".supermarket_info") do
      expect(page).to have_content(supermarket_1.location)
    end

    within(".customers") do
      expect(page).to have_content(customer_1.name)
      expect(page).to have_content(customer_2.name)
      expect(page).to have_content(customer_3.name)

    end
  end


end
