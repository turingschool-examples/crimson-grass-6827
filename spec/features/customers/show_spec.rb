require 'rails_helper'

RSpec.describe "customers show page" do 
  describe "US1 Show page" do 
    before(:each) do 
      @store_1 = Supermarket.create!(name: "Kroger", location: "123 Fruit St")
      @store_2 = Supermarket.create!(name: "Safeway", location: "123 Food St")
      @store_3 = Supermarket.create!(name: "Sprouts", location: "123 Organic St")

      @customer_1 = Customer.create!(name: "Jane K")
      @customer_2 = Customer.create!(name: "Rachel W")
      @customer_3 = Customer.create!(name: "Camila M")

      @item_1 = @store_1.items.create!(name: "Banana", price: 1)
      @item_2 = @store_1.items.create!(name: "Apple", price: 2)

      @item_3 = @store_2.items.create!(name: "Pear", price: 3)
      @item_1 = @store_3.items.create!(name: "Banana", price: 1)

      @item_2 = @store_3.items.create!(name: "Apple", price: 2)
      @item_3 = @store_2.items.create!(name: "Pear", price: 3)

      CustomerItem.create!(customer: @customer_1, item: @item_1)
      CustomerItem.create!(customer: @customer_1, item: @item_2)

      CustomerItem.create!(customer: @customer_2, item: @item_3)
      CustomerItem.create!(customer: @customer_2, item: @item_1)

      CustomerItem.create!(customer: @customer_3, item: @item_2)
      CustomerItem.create!(customer: @customer_3, item: @item_3)


    end
    it "displays a customer's name and the list of their items" do 
      visit "/customers/#{@customer_1.id}"
      
      within '#customer_name' do 
      expect(page).to have_content("Customer Name: Jane K")
      end

      within '#item_list' do 
      expect(page).to have_content("Banana")
      expect(page).to have_content("Apple")
      expect(page).to_not have_content("Pear")
      end
      

      visit "/customers/#{@customer_2.id}"

      within '#customer_name' do 
      expect(page).to have_content("Customer Name: Rachel W")
      end

      within '#item_list' do 
      expect(page).to have_content("Pear")
      expect(page).to have_content("Banana")
      expect(page).to_not have_content("Apple")
      end

      visit "/customers/#{@customer_3.id}"
  
      within '#customer_name' do 
      expect(page).to have_content("Customer Name: Camila M")
      end
  
      within '#item_list' do 
      expect(page).to have_content("Apple")
      expect(page).to have_content("Pear")
      expect(page).to_not have_content("Banana")
      end
    end
  end
end