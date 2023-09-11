class Supermarket < ApplicationRecord
  has_many :items

  def supermarket_customers
    customers = Customer.joins(items: :supermarket).where("supermarkets.name = '#{self.name}'").distinct.order(:name)
  end
end