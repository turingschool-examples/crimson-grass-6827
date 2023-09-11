require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "can have many items" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey])

    expect(corey.items).to include(cereal, prime_rib)
  end
end
