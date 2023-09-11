class Customer < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_items

  def add_item(item_id)
    self.items << Item.find(item_id)
  end
end
