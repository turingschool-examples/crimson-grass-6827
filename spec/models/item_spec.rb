require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  before :each do
    @michael_phelps = Customer.create!(name: "Michael Phelps")
    @serena_williams = Customer.create!(name: "Serena Williams")

    @sprouts = Supermarket.create!(name: "Sprouts", location: "123 Food St.")

    @apples = @sprouts.items.create!(name: "Apples", price: 2)

    CustomerItem.create!(customer_id: @michael_phelps.id, item_id: @apples.id)
    CustomerItem.create!(customer_id: @serena_williams.id, item_id: @apples.id)
  end

  describe "#customer_count" do
    it "can count the number of customers who have bought an item" do
      query = @apples.customer_count

      expect(query).to eq(2)
    end
  end
end