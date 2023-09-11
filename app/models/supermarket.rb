class Supermarket < ApplicationRecord
  has_many :items

  def unique_customers
    Customer.joins(:customer_items)
            .joins(:items)
            .where('items.supermarket_id = ?', self.id)
            .distinct
  end
end