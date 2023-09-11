class Customer < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_items

  def add_item(item_id)
    item = Item.find(item_id)
    items << item
  end
end