class Item < ApplicationRecord
  belongs_to :supermarket
  has_many :customer_items
  has_many :customers, through: :customer_items

  def get_supermarket_name
    supermarket = Supermarket.find(self.supermarket_id)
    supermarket.name
  end

  def get_customer_count
    customers.count
  end
end