require 'rails_helper'

RSpec.describe CustomersItem, type: :model do
  describe 'relationships' do
    it { should belong_to :item }
    it { should belong_to :customer}
  end
end