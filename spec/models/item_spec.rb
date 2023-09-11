require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe "instance methods" do
    describe "#customer_count" do
      it "returns count of customers that have bought item" do
        customer_1 = Customer.create!(name: "Sally Shopper")

        customer_2 = Customer.create!(name: "Billy Buyer")

        supermarket_1 = Supermarket.create!(
          name: "Corner Market",
          location: "123 Food Street"
        )

        banana = supermarket_1.items.create!(
          name: "Banana",
          price: 1
        )

        CustomerItem.create!(customer: customer_1, item: banana)
        CustomerItem.create!(customer: customer_2, item: banana)

        expect(banana.customer_count).to eq(2)
      end
    end
  end
end