require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  describe 'instance methods' do
    describe '#unique_customers' do
      it 'returns a unique list of customers for that supermarket' do
        will = Customer.create!(name: 'Will')
        stephen = Customer.create!(name: 'Stephen')
        soopers = Supermarket.create!(name: 'Soopers', location: 'Denver')
        steak = soopers.items.create!(name: 'Steak', price: 10)

        will.items << steak
        will.items << steak
        stephen.items << steak

        expect(soopers.unique_customers).to eq([will, stephen])
      end
    end
  end
end