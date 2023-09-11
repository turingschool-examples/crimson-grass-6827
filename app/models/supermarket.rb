class Supermarket < ApplicationRecord
  has_many :items

  # def self.unique_customers(store)
  #   joins(items: {customer_items: :customer}).where(:name == store)
  # end
end