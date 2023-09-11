require "rails_helper"

RSpec.describe Supermarket, type: :model do
  describe "relationships" do
    it { should have_many :items }

    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end
end
