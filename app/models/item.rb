class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customers
end