require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items)}
  end

  describe "instance methods" do
    before(:each) do
      @supermarket_1 = Supermarket.create!(name: "Get ya Fishes", location: "1234 Fish St")
      @item_1 = @supermarket_1.items.create!(name: "Tuna", price: 2)
      @item_2 = @supermarket_1.items.create!(name: "Red Snapper", price: 5)
      @item_3 = @supermarket_1.items.create!(name: "Salmon", price: 3)
      @customer_1 = Customer.create!(name: "Tyler")
      @customer_2 = Customer.create!(name: "Kiwi")
      CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_1.id)
      CustomerItem.create!(item_id: @item_1.id, customer_id: @customer_2.id)
      CustomerItem.create!(item_id: @item_2.id, customer_id: @customer_1.id)
    end

    describe "total_purchased" do
      it "returns the count of items purchased across all customers" do
        expect(@item_1.total_purchased).to eq(2)
      end
    end
  end
end