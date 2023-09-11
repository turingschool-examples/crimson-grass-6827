require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customers).through(:items)}
  end
  
  describe "instance methods" do
    before(:each) do
      @supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
      @item_1 = @supermarket_1.items.create!(name: "Tuna", price: 2)
      @item_2 = @supermarket_1.items.create!(name: "Red Snapper", price: 5)
      @item_3 = @supermarket_1.items.create!(name: "Salmon", price: 3)
      @customer_1 = Customer.create!(name: "Tyler")
      @customer_2 = Customer.create!(name: "Kiwi")
      @customer_3 = Customer.create!(name: "Chicken")
      CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
      CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_2.id)
      CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
    end

    describe "#all_customers" do
      it "returns an array of all unique customers names that have shopped at the supermarket" do
        expect(@supermarket_1.all_customers).to include(@customer_1.name, @customer_2.name)
      end
    end
  end
end