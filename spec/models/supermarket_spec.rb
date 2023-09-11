require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  before(:each) do
    @customer_1 = Customer.create!(name: "Willy")
    @kings = Supermarket.create!(name: "King Supers", location: "Fort Collins")
    @tomato = @kings.items.create!(name: "Tomato", price: 1)
    CustomersItem.create!(customer_id: @customer_1.id, item_id: @tomato.id)
  end
  describe 'relationships' do
    it { should have_many :items }
  end

  describe '#find_market_by_item' do
    it 'finds what market an item belongs to' do
      expect(Supermarket.find_market_by_item(@tomato)).to eq(@kings)
    end
  end
end