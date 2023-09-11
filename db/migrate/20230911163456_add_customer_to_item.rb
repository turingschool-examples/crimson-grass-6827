class AddCustomerToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :customer, null: false, foreign_key: true
  end
end
