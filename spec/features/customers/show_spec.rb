require "rails_helper"

RSpec.describe "Customer Show", type: :feature do
  before(:each) do
    @supermarket = Supermarket.create!(
      name: "Fieri's Flavor Shop",
      location: "Flavor Town"
    )
    @item1 = @supermarket.item.create!(
      name: "The Juice",
      price: "7"
    )
    @item2 = @supermarket.item.create!(
      name: "The Sauce",
      price: "11"
    )
    @customer = Customer.create!(
      name: "Guy F. Eri"
    )
  end

  describe "as a visitor" do
    describe "when I visit a customer show page" do
      it "then I can see the customers name, a lists of their items (name and price included) and the name of the supermarket that it belongs to" do
        visit "/customers/#{@customer.id}"

        expect(page).to have_content("#{@customer.name}")
        expect(page).to have_content("#{@item1.name}")
        expect(page).to have_content("#{@item1.price}")
        expect(page).to have_content("#{@item2.name}")
        expect(page).to have_content("#{@item2.price}")
        expect(page).to have_content("#{@supermarket.name}")
      end
    end
  end
end
