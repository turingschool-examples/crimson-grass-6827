class Item < ApplicationRecord
  validates_presence_of :name, :price

  belongs_to :supermarket
  has_and_belongs_to_many :customers, join_table: 'customer_items'

  def customer_count
    self.customers.count
  end
end