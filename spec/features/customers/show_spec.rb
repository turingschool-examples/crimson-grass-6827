require 'rails_helper'

RSpec.describe "As a visitor when I vist '/customers/:id'" do
  before :each do
    @king_soops = Supermarket.create!(name: "King Soopers", location: "123 Food St.")
    @bagel = @king_soops.items.create!(name: "Everything Bagel", price: 2)
    @egg = @king_soops.items.create!(name: "Egg (not microwaved)", price: 1)
    @bacon = @king_soops.items.create!(name: "Thick-Cut Bacon", price: 4)
    @cheese = @king_soops.items.create!(name: "Estate Gouda", price: 3)
    @hot_sauce = @king_soops.items.create!(name: "Swamp Mustard", price: 6)

    @reed = @bagel.customers.create!(name: "Reed")

    @reed.items << @egg
    @reed.items << @bacon
    @reed.items << @cheese
  end

  it "I see the customer name and a list of its items and the item details" do
    visit "customers/#{@reed.id}"

    expect(page).to have_content(@reed.name)
    expect(page).to have_content(@bagel.name)
    expect(page).to have_content(@bagel.price)
    expect(page).to have_content(@egg.name)
    expect(page).to have_content(@egg.price)
    expect(page).to have_content(@bacon.name)
    expect(page).to have_content(@bacon.price)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@cheese.price)
    expect(page).to have_content(@king_soops.name)
  end

  it "I see a form to add an existing item to the customer's shopping list" do
    visit "customers/#{@reed.id}"

    expect(page).not_to have_content(@hot_sauce.name)
    expect(page).not_to have_content(@hot_sauce.price)


    fill_in :item_id, with: @hot_sauce.id
    click_button "Add Item"

    expect(current_path).to eq("/customers/#{@reed.id}")

    expect(page).to have_content(@hot_sauce.name)
    expect(page).to have_content(@hot_sauce.price)
  end
end