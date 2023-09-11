require "rails_helper"

RSpec.describe "Supermarkets Show Page", type: :feature do
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
    describe "When I visit a supermarket's show page" do
      it "displays a unique list of all customers that have shopped at the supermarket" do
        visit "/supermarkets/#{@sprouts.id}"

        expect(page).to have_content("Supermarket: #{@sprouts.name}")
        expect(page).to have_content("Customers who have shopped at #{@sprouts.name}:")
        expect(page).to have_content("#{@michael_phelps.name}")
        expect(page).to have_content("#{@serena_williams.name}")
      end
    end
  end
end