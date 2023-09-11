require 'rails_helper'

RSpec.describe "Customer show", type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @customer_1 = Customer.create!(name: "Willy")
      @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
      @tomato = @kings.items.create!(name: "Tomato", price: 1)
      CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
    end

    it "I see the customer's name, And i see a list of it's items
  including the item's name, price, and the name of the supermarket that it belongs to" do
    
    visit "/customers/#{@customer_1.id}"
    save_and_open_page

    expect(page).to have_content(@customer_1.name)
    expect(page).to have_content(@tomato.name)
    expect(page).to have_content(@tomato.price)
    expect(page).to have_content(@kings.name)
    end
  end
end