require 'rails_helper'

RSpec.describe "Customer show", type: :feature do
  before(:each) do
    @customer_1 = Customer.create!(name: "Willy")
    @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
    @tomato = @kings.items.create!(name: "Tomato", price: 1)
    @onion = @kings.items.create!(name: "onion", price: 1)
    CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
  end
  describe 'As a visitor' do
    describe 'When I visit /customers/:id' do
      it "I see the customer's name, And i see a list of it's items
      including the item's name, price, and the name of the supermarket that it belongs to" do
        
        visit "/customers/#{@customer_1.id}"
    
        expect(page).to have_content(@customer_1.name)
        within(".item_list")do
          expect(page).to have_content(@tomato.name)
          expect(page).to have_content(@tomato.price)
          expect(page).to have_content(@kings.name)
        end
      end

      it "I see a form to add an item to this customer. When I fill in a field with the ID of an existing item
      and click submit, then I am redirected back to customer's show page and I see the new item listed" do

        visit "/customers/#{@customer_1.id}"

        fill_in "item", with: "#{@onion.id}"
        click_on "Submit"

        within(".item_list") do
          expect(page).to have_content(@onion.name)
        end
      end
    end
  end
end