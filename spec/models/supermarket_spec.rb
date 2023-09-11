require 'rails_helper'

RSpec.describe Supermarket, type: :model do
  describe 'relationships' do
    it { should have_many :items }
  end

  # describe "#unique_customers" do
  #   it "All items names, cost, supermarket and how may were purchased" do
  #     abel = Customer.create!(name: "Abel")
  #     blake = Customer.create!(name: "Blake")
  #     cici = Customer.create!(name: "Cici")
  #     david = Customer.create!(name: "david")

  #     albertsons = Supermarket.create!(name: "Albertsons", location: "Denver")
  #     bingos = Supermarket.create!(name: "Bingos", location: "Denver")

  #     apple = albertsons.items.create!(name: "apple", price: 1)
  #     bread = albertsons.items.create!(name: "bread", price: 2)
  #     corn = albertsons.items.create!(name: "corn", price: 4)
  #     donut = bingos.items.create!(name: "donut", price: 8)
  #     eggs = bingos.items.create!(name: "eggs", price: 16)

  #    CustomerItem.create!(customer: blake, item: apple)
  #    CustomerItem.create!(customer: abel, item: bread)
  #    CustomerItem.create!(customer: blake, item: corn)
  #    CustomerItem.create!(customer: abel, item: corn)
  #    CustomerItem.create!(customer: cici, item: corn)
  #    CustomerItem.create!(customer: blake, item: donut)

  #    expect(Supermarket.unique_customers(albertsons.name)).to eq([abel, blake, cici])
  #   end
  # end




end