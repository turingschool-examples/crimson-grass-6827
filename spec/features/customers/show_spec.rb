require "rails_helper"

RSpec.feature "the customer show page" do
  describe 'when visiting /customers/:id' do
    it 'US1 displays customer, items, and supermarket' do
      will = Customer.create!(name: "Will")
      costco = Supermarket.create(name: "Costco", location: "Arvada")
      steak = costco.items.create(name: "Steak", price: 10)
      fries = costco.items.create(name: "Fries", price: 2)
      will.items << steak
      will.items << fries

      visit "/customers/#{will.id}"

      expect(page).to have_content(will.name)
      expect(page).to have_content(steak.name)
      expect(page).to have_content(steak.price)
      expect(page).to have_content(fries.name)
      expect(page).to have_content(fries.price)
      expect(page).to have_content(costco.name)
    end
  end
end


