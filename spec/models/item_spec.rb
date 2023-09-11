require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

before :each do
  @king_soops = Supermarket.create!(name: "King Soopers", location: "123 Food St.")
  @city_market = Supermarket.create!(name: "City Market", location: "456 Food St.")
  @bagel = @king_soops.items.create!(name: "Everything Bagel", price: 2)
  @egg = @king_soops.items.create!(name: "Egg (not microwaved)", price: 1)
  @bacon = @king_soops.items.create!(name: "Thick-Cut Bacon", price: 4)
  @cheese = @king_soops.items.create!(name: "Estate Gouda", price: 3)
  @hot_sauce = @city_market.items.create!(name: "Swamp Mustard", price: 6)

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

  describe '#customer_count' do
    it "returns number of customers" do
      expect(@bagel.customer_count).to eq(3)
      expect(@egg.customer_count).to eq(2)
      expect(@bacon.customer_count).to eq(1)
      expect(@cheese.customer_count).to eq(2)
      expect(@hot_sauce.customer_count).to eq(2)
    end
  end

  describe '#supermarket_name' do
    it "returns name of the item's supermarket" do
      expect(@bagel.supermarket_name).to eq("King Soopers")
      expect(@hot_sauce.supermarket_name).to eq("City Market")
    end
  end
end