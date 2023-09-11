class Customer < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_items
  validates_presence_of :name

  # def supermarket_name
  #   items.supermarket_id
end