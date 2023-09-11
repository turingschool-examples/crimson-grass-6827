class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has_many :customers, through: :customer_items

  validates :name, presence: true
  validates :price, presence: true

  def count_of_customers
    self.customers.distinct.size
  end
end