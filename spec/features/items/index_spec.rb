require "rails_helper"

RSpec.feature "the items index page" do
  describe 'when visiting /items' do
    it 'US2 displays all items with supermarket name and customer count' do
      will = Customer.create!(name: "Will")
      stephen = Customer.create!(name: "Stephen")

      soopers = Supermarket.create!(name: "Soopers", location: "Denver")
      costco = Supermarket.create!(name: "Costco", location: "Arvada")

      cereal = soopers.items.create!(name: "Cereal", price: 5)
      milk = soopers.items.create!(name: "Milk", price: 3)

      will.items << cereal

      stephen.items << cereal
      stephen.items << milk

      visit "/items"

      within("tr:contains('#{milk.name}')") do
        expect(page).to have_content(milk.name)
        expect(page).to have_content(milk.price)
        expect(page).to have_content(soopers.name)
        expect(page).to have_content(1)
      end

      within("tr:contains('#{cereal.name}')") do
        expect(page).to have_content(cereal.name)
        expect(page).to have_content(cereal.price)
        expect(page).to have_content(soopers.name)
        expect(page).to have_content(2)
      end
    end
  end
end
