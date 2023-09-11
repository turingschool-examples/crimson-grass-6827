require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :customer_items }
    it { should have_many(:items).through(:customer_items) }
  end

  it "#add_item" do
    customer = Customer.create(name:"Bob")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    customer.add_item(item_1.id)
    customer.add_item(item_2.id)
    customer.add_item(item_3.id)

    expect(customer.items).to include(item_1, item_2, item_3)
  end
end