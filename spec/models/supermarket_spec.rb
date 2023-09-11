require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  it "#unique_customer_names" do
    customer_1 = Customer.create(name:"Bob")
    customer_2 = Customer.create(name:"Dave")
    customer_3 = Customer.create(name:"Steve")
    customer_4 = Customer.create(name:"Mindy")

    supermarket_1 = Supermarket.create(name:"Safeway", location:"Denver")
    supermarket_2 = Supermarket.create(name:"Kingsoopers", location:"Parker")
    item_1 = Item.create(name: "Peas", price: 2, supermarket_id: supermarket_1.id)
    item_2 = Item.create(name: "Carrots", price: 2, supermarket_id: supermarket_1.id)
    item_3 = Item.create(name: "Chicken", price: 5, supermarket_id: supermarket_1.id)

    customer_1.add_item(item_1.id)
    customer_2.add_item(item_2.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)
    customer_3.add_item(item_3.id)

    expect(supermarket_1.unique_customer_names).to include(customer_1.name,customer_2.name,customer_3.name)
  end
end