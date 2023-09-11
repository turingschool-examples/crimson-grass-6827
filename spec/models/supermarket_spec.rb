require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
    it { should have_many(:customers).through(:items) }
  end

  describe "instance methods" do
    describe "#find_customers" do
      it "should returns distinct customers of the supermarket" do
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

        apple = supermarket_1.items.create!(
          name: "Apple",
          price: 2
        )

        orange = supermarket_1.items.create!(
          name: "Orange",
          price: 3
        )

        CustomerItem.create!(customer: customer_1, item: banana)
        CustomerItem.create!(customer: customer_1, item: apple)
        CustomerItem.create!(customer: customer_1, item: orange)
        
        CustomerItem.create!(customer: customer_2, item: apple)
        CustomerItem.create!(customer: customer_2, item: orange)

        expect(supermarket_1.find_customers).to eq([customer_1, customer_2])
      end
    end
  end
end