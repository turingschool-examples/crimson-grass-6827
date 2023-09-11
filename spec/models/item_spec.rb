require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe 'instance methods' do
    it "#supermarket_name" do
      supermarket = Supermarket.create!(name: "Supermarket 1", location: "Boulder, CO")
      item = Item.create!(name: "Milk", price: 3, supermarket_id: supermarket.id)

      expect(item.supermarket_name).to eq("Supermarket 1")
    end

    it "#customer_count" do
      supermarket = Supermarket.create!(name: "Supermarket 1", location: "Boulder, CO")
      item = Item.create!(name: "Milk", price: 3, supermarket_id: supermarket.id)
      customer1 = Customer.create!(name: "John Smith")
      customer2 = Customer.create!(name: "Jane Doe")
      CustomerItem.create!(item: item, customer: customer1)
      CustomerItem.create!(item: item, customer: customer2)

      expect(item.customer_count).to eq(2)
    end
  end
end