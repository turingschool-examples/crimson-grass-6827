class Supermarket < ApplicationRecord
  has_many :items

  def customer_list
    customer_names = []

    items.each do |item|
      customer_names << item.customers.pluck(:name)
    end

    customer_names.flatten.uniq.join(", ")
  end
end