require 'rails_helper'

RSpec.describe "As a visitor when I visit '/items'" do
  before :each do
    @king_soops = Supermarket.create!(name: "King Soopers", location: "123 Food St.")
    @bagel = @king_soops.items.create!(name: "Everything Bagel", price: 2)
    @egg = @king_soops.items.create!(name: "Egg (not microwaved)", price: 1)
    @bacon = @king_soops.items.create!(name: "Thick-Cut Bacon", price: 4)
    @cheese = @king_soops.items.create!(name: "Estate Gouda", price: 3)
    @hot_sauce = @king_soops.items.create!(name: "Swamp Mustard", price: 6)

    @reed = @bagel.customers.create!(name: "Reed")
    @bob = @bagel.customers.create!(name: "Bob")
    @mike = @bagel.customers.create!(name: "Mike")

    @reed.items << @egg
    @reed.items << @bacon
    @reed.items << @cheese
    @bob.items << @hot_sauce
    @bob.items << @cheese
    @mike.items << @egg
    @mike.items << @hot_sauce
  end


  it "I see a list of all items and their details, and the count of customers that bought the item" do
    visit "/items"

    within("#item-#{@bagel.id}") do
      expect(page).to have_content(@bagel.name)
      expect(page).to have_content(@bagel.price)
      expect(page).to have_content(@king_soops.name)
      expect(page).to have_content(@bagel.customer_count)
    end
    within("#item-#{@egg.id}") do
      expect(page).to have_content(@egg.name)
      expect(page).to have_content(@egg.price)
      expect(page).to have_content(@king_soops.name)
      expect(page).to have_content(@egg.customer_count)
    end
    within("#item-#{@bacon.id}") do
      expect(page).to have_content(@bacon.name)
      expect(page).to have_content(@bacon.price)
      expect(page).to have_content(@king_soops.name)
      expect(page).to have_content(@bacon.customer_count)
    end
    within("#item-#{@cheese.id}") do
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@cheese.price)
      expect(page).to have_content(@king_soops.name)
      expect(page).to have_content(@cheese.customer_count)
    end
    within("#item-#{@hot_sauce.id}") do
      expect(page).to have_content(@hot_sauce.name)
      expect(page).to have_content(@hot_sauce.price)
      expect(page).to have_content(@king_soops.name)
      expect(page).to have_content(@hot_sauce.customer_count)
    end
  end
end