require 'rails_helper'

RSpec.describe Customer, type: :model do

  before(:each) do
    @supermarket = Supermarket.create(name: "Whole Foods", location: "124 Wall St.")
    @customer1 = Customer.create(name: "John Dwayne")
    @item1 = @customer1.items.create(name: "Banana", price: 20)
  end

  describe 'relationships' do
    it { should have_many :customer_items}
    it { should have_many(:items).through(:customer_items) }
  end

  describe '#items_names' do
    it "should pull the name of items" do
      require 'pry';binding.pry
      expect(@customer1.items_names).to eq(["Banana"])
    end
  end
end