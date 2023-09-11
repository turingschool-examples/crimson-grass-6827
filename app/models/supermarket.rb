class Supermarket < ApplicationRecord
  has_many :items
  has_many :customers, through: :items
  validates :name, presence: true
  validates :location, presence: true

  def market_customers
    Supermarket.joins(items: :customers).where("supermarkets.name = ?", self.name).distinct.pluck("customers.name")
  end
end 