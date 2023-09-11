require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'associations' do
    it { should have_many(:customer_items) }
    it { should have_many(:items).through(:customer_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end