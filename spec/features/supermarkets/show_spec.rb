require 'rails_helper'

RSpec.describe "Supermarkets Show page", type: :feature do
  before(:each) do
    @customer_1 = Customer.create!(name: "Willy")
    @customer_2 = Customer.create!(name: "Dan")
    @customer_3 = Customer.create!(name: "Shelly")
    @customer_4 = Customer.create!(name: "Lily")
    @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
    @target = Supermarket.create!(name: "Target", location: "Fort Colilns")
    @gum = @target.items.create!(name: "Gum", price: 1)
    @tomato = @kings.items.create!(name: "Tomato", price: 1)
    @onion = @kings.items.create!(name: "onion", price: 1)
    CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_2.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_3.id, item_id: @tomato.id)
    CustomersItem.create!(customer_id: @customer_3.id, item_id: @onion.id)
    CustomersItem.create!(customer_id: @customer_4.id, item_id: @gum.id)
  end
  describe "As a visitor" do
    describe "When I visit /supermarkets/:id" do
      it "I see a unique list of all customers that have shopped at the supermarket" do

        visit "/supermarkets/#{@kings.id}" 

        expect(page).to have_content(@customer_1.name)
        expect(page).to have_content(@customer_2.name)
        expect(page).to have_content(@customer_3.name)
        expect(page).to_not have_content(@customer_4.name)

        save_and_open_page
      end
    end
  end
end