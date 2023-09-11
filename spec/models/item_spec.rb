require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:customers).through(:customer_items) }
  end

  it "#get_supermarket_name" do
    customer_1 = Customer.create(name:"Bob")
    customer_2 = Customer.create(name:"Dave")
    customer_3 = Customer.create(name:"Steve")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    expect(item_1.get_supermarket_name).to eq("Safeway")
  end

  it "#get_customer_count" do
    customer_1 = Customer.create(name:"Bob")
    customer_2 = Customer.create(name:"Dave")
    customer_3 = Customer.create(name:"Steve")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    customer_1.add_item(item_1.id)
    customer_2.add_item(item_2.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)

    expect(item_3.get_customer_count).to eq(3)
  end
end