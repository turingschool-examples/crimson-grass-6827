require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }

  end

  it "can have many customers" do
    supermarket = Supermarket.create!(name: "ABC Market", location: "123 Sesame Street")
    corey = Customer.create!(name: "Corey")
    elmer = Customer.create!(name: "Elmer")
    cereal = supermarket.items.create!(name: "Cereal", price: 3, customers: [corey, elmer])
    prime_rib = supermarket.items.create!(name: "Prime Rib", price: 21, customers: [corey, elmer])

    expect(cereal.customers).to include(corey, elmer)
  end
end