class Customer < ApplicationRecord
  has_and_belongs_to_many :items

  def add_item(item_id)
    item = Item.find(item_id)
    items << item 
  end
end
