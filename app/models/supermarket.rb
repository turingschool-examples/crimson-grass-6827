class Supermarket < ApplicationRecord
  has_many :items

  def self.find_market_by_item(item)
    find(item.supermarket_id)
  end
end