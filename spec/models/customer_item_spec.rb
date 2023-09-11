require 'rails_helper'

RSpec.describe CustomerItem, type: :model do
  describe 'associations' do
    it {should belong_to :item}
    it {should belong_to :customer}
  end

  describe 'validations' do
    it {should validate_presence_of :item_id}
    it {should validate_presence_of :customer_id}
  end
end