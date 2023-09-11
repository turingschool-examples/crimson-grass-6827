require "rails_helper"

RSpec.describe Item, type: :model do
  describe "relationships" do
    it { should belong_to :supermarket }
    it { should have_many :customers }

    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
  end
end
