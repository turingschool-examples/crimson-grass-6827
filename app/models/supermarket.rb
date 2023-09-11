class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items

  def find_customers
    customers.distinct
  end
end