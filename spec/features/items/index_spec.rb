require "rails_helper"

RSpec.describe "item index", type: :feature do
  describe "as a visitor" do
    it "All items names, cost, supermarket and how may were purchased" do
      abel = Customer.create!(name: "Abel")
      blake = Customer.create!(name: "Blake")
      cici = Customer.create!(name: "Cici")

      albertsons = Supermarket.create!(name: "Albertsons", location: "Denver")
      bingos = Supermarket.create!(name: "Bingos", location: "Denver")

      apple = albertsons.items.create!(name: "apple", price: 1)
      bread = albertsons.items.create!(name: "bread", price: 2)
      corn = albertsons.items.create!(name: "corn", price: 4)
      donut = bingos.items.create!(name: "donut", price: 8)
      eggs = bingos.items.create!(name: "eggs", price: 16)

     CustomerItem.create!(customer: blake, item: apple)
     CustomerItem.create!(customer: abel, item: bread)
     CustomerItem.create!(customer: blake, item: corn)
     CustomerItem.create!(customer: abel, item: corn)
     CustomerItem.create!(customer: cici, item: corn)
     CustomerItem.create!(customer: blake, item: donut)

      visit "items/"
      
      expect(page).to have_content("apple")
      expect(page).to have_content("$16")
      expect(page).to have_content("Albertsons")
      expect(page).to have_content("Bingos")
      expect(page).to have_content("All Items")
      expect(find("#item-#{corn.id}")).to have_content(3)
      expect(find("#item-#{apple.id}")).to have_content(1)
    end
  end
end