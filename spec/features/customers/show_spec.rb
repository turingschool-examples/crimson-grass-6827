require "rails_helper"

RSpec.describe "Customer Show", type: :feature do
  describe "as a visitor" do
    it "shows the customers items, and items' attritutes" do
      abel = Customer.create!(name: "Abel")

      albertsons = Supermarket.create!(name: "Albertsons", location: "Denver")

      apple = albertsons.items.create!(name: "apple", price: 1)
      bread = albertsons.items.create!(name: "bread", price: 2)
      corn = albertsons.items.create!(name: "corn", price: 4)

     CustomerItem.create!(customer: abel, item: apple)
     CustomerItem.create!(customer: abel, item: bread)
     CustomerItem.create!(customer: abel, item: corn)

      visit "customers/#{abel.id}"

      expect(page).to have_content("Abel")
      expect(page).to have_content("Albertsons")
      expect(page).to have_content("apple")
      expect(page).to have_content("$2")
      expect(page).to have_content("bread")
      expect(page).to have_content("corn")
    end

    it "a customer can add items of existing projects at the supermarket" do
      abel = Customer.create!(name: "Abel")

      albertsons = Supermarket.create!(name: "Albertsons", location: "Denver")

      apple = albertsons.items.create!(name: "apple", price: 1)
      bread = albertsons.items.create!(name: "bread", price: 2)
      corn = albertsons.items.create!(name: "corn", price: 4)
      donut = albertsons.items.create!(name: "donut", price: 8)
      eggs = albertsons.items.create!(name: "eggs", price: 16)

     CustomerItem.create!(customer: abel, item: apple)
     CustomerItem.create!(customer: abel, item: bread)
     CustomerItem.create!(customer: abel, item: corn)

      visit "customers/#{abel.id}"

      fill_in "Item ID", with: "#{donut.id}"
      click_button "Add"

      expect(page).to have_content("donut")
    end


  end
end

