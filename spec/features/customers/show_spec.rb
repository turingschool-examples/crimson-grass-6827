require 'rails_helper'

RSpec.describe "customers show page" do 
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
    @item_4 = @store_3.items.create!(name: "Orange", price: 4)

    @item_5 = @store_3.items.create!(name: "Grapefruit", price: 5)
    @item_6 = @store_2.items.create!(name: "Avocado", price: 6)

    CustomerItem.create!(customer: @customer_1, item: @item_1)
    CustomerItem.create!(customer: @customer_1, item: @item_2)
    CustomerItem.create!(customer: @customer_1, item: @item_3)
    CustomerItem.create!(customer: @customer_1, item: @item_4)

    CustomerItem.create!(customer: @customer_2, item: @item_5)
    CustomerItem.create!(customer: @customer_2, item: @item_6)
    CustomerItem.create!(customer: @customer_2, item: @item_1)
    CustomerItem.create!(customer: @customer_2, item: @item_2)

    CustomerItem.create!(customer: @customer_3, item: @item_3)
    CustomerItem.create!(customer: @customer_3, item: @item_4)
    CustomerItem.create!(customer: @customer_3, item: @item_5)
    CustomerItem.create!(customer: @customer_3, item: @item_6)

  end

  describe "US1 Show page" do 
    it "displays a customer's name and the list of their items" do 
      visit "/customers/#{@customer_1.id}"

      within '#customer_name' do 
        expect(page).to have_content("Customer Name: Jane K")
      end

      within '#item_list' do 
        expect(page).to have_content("Banana, $1, Supermarket: Kroger")
        expect(page).to have_content("Apple, $2, Supermarket: Kroger")
        expect(page).to have_content("Pear, $3, Supermarket: Safeway")
        expect(page).to have_content("Orange, $4, Supermarket: Sprouts")
        expect(page).to_not have_content("Grapefruit, $5, Supermarket: Sprouts")
      end
      

      visit "/customers/#{@customer_2.id}"
      
      within '#customer_name' do 
        expect(page).to have_content("Customer Name: Rachel W")
      end

      within '#item_list' do 
        expect(page).to have_content("Grapefruit, $5, Supermarket: Sprouts")
        expect(page).to have_content("Avocado, $6, Supermarket: Safeway")
        expect(page).to have_content("Banana, $1, Supermarket: Kroger")
        expect(page).to have_content("Apple, $2, Supermarket: Kroger")
        expect(page).to_not have_content("Orange, $4, Supermarket: Sprouts")
      end

      visit "/customers/#{@customer_3.id}"
      
      within '#customer_name' do 
        expect(page).to have_content("Customer Name: Camila M")
      end
  
      within '#item_list' do 
        expect(page).to have_content("Pear, $3, Supermarket: Safeway")
        expect(page).to have_content("Orange, $4, Supermarket: Sprouts")
        expect(page).to have_content("Grapefruit, $5, Supermarket: Sprouts")
        expect(page).to have_content("Avocado, $6, Supermarket: Safeway")
        expect(page).to_not have_content("Apple, $2, Supermarket: Kroger")
      end
    end
  end

  describe "us2 - Form to add an item" do 
    xit "displays a form for the customer to add a new item to their list" do 
      visit "/customers/#{@customer_1.id}"

      within '#add_item' do
        expect(page).to have_field('search')

        fill_in 'search', with: "Avocado"
        click_button 'Search'
      end 

      within '#item_list' do 
        expect(page).to have_content("Avocado, $6, Supermarket: Safeway")
      end
    end
  end

end