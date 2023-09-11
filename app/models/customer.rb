class Customer < ApplicationRecord
  has_many :customers_items
  has_many :items, through: :customers_items

  def self.find_supermarket_shoppers(supermarket)
    find_by_sql("select distinct customers.name from customers
    inner join customers_items on customers.id = customers_items.customer_id
    inner join items on items.id = customers_items.item_id
    inner join supermarkets on items.supermarket_id = #{supermarket.id}")
  end
end