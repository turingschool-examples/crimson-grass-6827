require 'rails_helper'

RSpec.describe "Supermarkets Show", type: :feature do
  describe "As a visitor, when I visit the Supermarket show page" do
    it "I can see a unique list of customers who shop at the supermarket" do
      @supermarket = Supermarket.create(name: "Reasors", location: "Tulsa, OK")
      @customer_1 = Customer.create(name: "Will")
      @customer_2 = Customer.create(name: "Dee")
      @customer_3 = Customer.create(name: "Test")

      @customer_1.items << @supermarket.items.create(name: "Banana", price: 1)
      @customer_2.items << @supermarket.items.create(name: "Apple", price: 1)
      @customer_3.items << @supermarket.items.create(name: "Cilantro", price: 1)

      visit "/supermarkets/#{@supermarket.id}"

      expect(page).to have_content(@customer_1.name)
      expect(page).to have_content(@customer_2.name)
      expect(page).to have_content(@customer_3.name)
    end
  end
end