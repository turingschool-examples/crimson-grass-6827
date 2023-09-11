class Supermarket < ApplicationRecord
  has_many :items

  def unique_customer_names
    names_list = []
    self.items.each do |item|
      item.customers.each do |cust|
        names_list << cust.name
      end
    end
    names_list.uniq
  end
end