require "rails_helper"

RSpec.describe "Items Index Page", type: :feature do
  before :each do
    @michael_phelps = Customer.create!(name: "Michael Phelps")
    @serena_williams = Customer.create!(name: "Serena Williams")

    @sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

    @bananas = @sprouts.items.create!(name: "Bananas", price: 1)
    @apples = @sprouts.items.create!(name: "Apples", price: 2)
    @oranges = @sprouts.items.create!(name: "Oranges", price: 3)
    @peaches = @sprouts.items.create!(name: "Peaches", price: 4)

    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @bananas.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @oranges.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @oranges.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @peaches.id)
  end

  describe "As a visitor" do
    describe "When I visit the items index page" do
      it "displays a list of all items, including the items name, price, the name of the supermarket that it belongs to, and the count of customers that bought that item" do
        visit "/items"

        expect(page).to have_content("All Items")
        expect(page).to have_content("#{@bananas.name}, Price: $#{@bananas.price}, Supermarket: #{@sprouts.name}, Customer Count: 1")
        expect(page).to have_content("#{@apples.name}, Price: $#{@apples.price}, Supermarket: #{@sprouts.name}, Customer Count: 2")
        expect(page).to have_content("#{@oranges.name}, Price: $#{@oranges.price}, Supermarket: #{@sprouts.name}, Customer Count: 2")
        expect(page).to have_content("#{@peaches.name}, Price: $#{@peaches.price}, Supermarket: #{@sprouts.name}, Customer Count: 1")
      end
    end
  end
end