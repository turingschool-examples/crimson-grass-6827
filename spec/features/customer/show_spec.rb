require 'rails_helper'

RSpec.describe "customer show page", type: :feature do
  before(:each) do
    @supermarket_1 = Supermarket.create!(name: "TJ Outpost", location: "1315 Trader Way")
    @supermarket_2 = Supermarket.create!(name: "Rainbow Grocery", location: "7634 Ocean Drive")
    
    @item_1 = Item.create!(name: "Chicken", price: 5, supermarket: @supermarket_1)
    @item_2 = Item.create!(name: "Tofu", price: 4, supermarket: @supermarket_2)
    @item_3 = Item.create!(name: "Chocolate", price: 2, supermarket: @supermarket_2)

    @customer_1 = Customer.create!(name: "James")
    @customer_2 = Customer.create!(name: "Lucy")
    @customer_1.items << @item_3
    @customer_1.items << @item_2
  end

  it "can show customers name, list of their items, the price of those items, and the supermarket those items came from" do
    visit "/customers/#{@customer_1.id}"
    expect(page).to have_content("Rainbow Grocery")
    expect(page).to have_content("Tofu")
    expect(page).to have_content(4)
    expect(page).to have_content("Chocolate")
    expect(page).to have_content(2)
    expect(page).to have_content("James")
    save_and_open_page
  end
end