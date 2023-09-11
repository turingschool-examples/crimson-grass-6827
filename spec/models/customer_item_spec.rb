require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  it "has a valid relationship to customer" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    customer_item = CustomerItem.create(customer: corey, item: cereal)

    expect(customer_item.customer).to eq(corey)
  end

  it "has a valid relationship to item" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    customer_item = CustomerItem.create(customer: corey, item: cereal)

    expect(customer_item.item).to eq(cereal)
  end
end
