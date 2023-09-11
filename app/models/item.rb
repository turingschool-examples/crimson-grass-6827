class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customers_items
  has_many :customers, trough: :customers_items
end