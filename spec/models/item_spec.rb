require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  describe "#count_of_customers" do
    it "should count the distinct number of customers that have bought the item" do
      customer_1 = Customer.create(name: "Josephine")
      customer_2 = Customer.create(name: "George")
      customer_3 = Customer.create(name: "Janie")
  
      supermarket_1 = Supermarket.create(name: "Albertson's", location: "1421 W Mockingbird LN")
      item_1 = Item.create(name: "salt", price: 2, supermarket_id: "#{supermarket_1.id}")
      item_2 = Item.create(name: "pasta", price: 3, supermarket_id: "#{supermarket_1.id}")
      item_3 = Item.create(name: "pasta sauce", price: 4, supermarket_id: "#{supermarket_1.id}")
      
      customer_item_1 = CustomerItem.create(customer: customer_1, item: item_1)
      customer_item_2 = CustomerItem.create(customer: customer_1, item: item_2)
      customer_item_3 = CustomerItem.create(customer: customer_1, item: item_3)
  
      customer_item_4 = CustomerItem.create(customer: customer_2, item: item_1)
      customer_item_5 = CustomerItem.create(customer: customer_2, item: item_2)
      customer_item_6 = CustomerItem.create(customer: customer_2, item: item_3)
  
      customer_item_7 = CustomerItem.create(customer: customer_3, item: item_3)

      expect(item_1.count_of_customers).to eq(2)
      expect(item_2.count_of_customers).to eq(2)
      expect(item_3.count_of_customers).to eq(3)
    end
  end
end