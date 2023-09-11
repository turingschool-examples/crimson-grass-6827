class Customer < ApplicationRecord
  validates_presence_of :name

  has_and_belongs_to_many :items, join_table: 'customer_items'
end