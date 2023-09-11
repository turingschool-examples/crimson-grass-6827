class CustomersItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def self.count_purchases(item)
    where('item_id = ?', item.id).count
  end
end