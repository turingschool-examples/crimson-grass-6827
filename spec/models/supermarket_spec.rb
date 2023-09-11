require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
  end

  before :each do
    @michael_phelps = Customer.create!(name: "Michael Phelps")
    @serena_williams = Customer.create!(name: "Serena Williams")

    @sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

    @bananas = @sprouts.items.create!(name: "Bananas", price: 1)
    @apples = @sprouts.items.create!(name: "Apples", price: 2)
    @oranges = @sprouts.items.create!(name: "Oranges", price: 3)
    @peaches = @sprouts.items.create!(name: "Peaches", price: 4)

    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @bananas.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @oranges.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @oranges.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @peaches.id)
  end

  describe "#supermarket_customers" do
    it "returns a list of unique customers who have shopped at the given supermarket" do
      query = @sprouts.supermarket_customers

      expect(query).to eq([@michael_phelps, @serena_williams])
    end
  end 
end