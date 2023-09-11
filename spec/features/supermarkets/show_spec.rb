require "rails_helper"

RSpec.feature "the supermarket show page" do
  describe 'when visiting /supermarkets/:id' do
    it 'EXT1 displays a unique list of customers for that supermarket' do
      will = Customer.create!(name: 'Will')
      stephen = Customer.create!(name: 'Stephen')
      soopers = Supermarket.create!(name: 'Soopers', location: 'Denver')
      steak = soopers.items.create!(name: 'Steak', price: 10)

      will.items << steak
      stephen.items << steak

      visit "/supermarkets/#{soopers.id}"
      
      expect(page).to have_content(will.name)
      expect(page).to have_content(stephen.name)
    end
  end
end



