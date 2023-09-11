require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
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

  describe '#customer_list' do
    it 'can return a list of unique customers' do
      expect(@city_market.customer_list).to include(@bob.name)
      expect(@city_market.customer_list).to include(@mike.name)
      expect(@city_market.customer_list).not_to include(@reed.name)
      expect(@king_soops.customer_list).to include(@bob.name)
      expect(@king_soops.customer_list).to include(@mike.name)
      expect(@king_soops.customer_list).to include(@reed.name)
    end
  end
end