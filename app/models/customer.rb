class Customer < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_items

  # def self.unique_customers_by_store(store)
  #   joins(customer_items: {items: :supermarket}).where(:name == store)
  # end

end