class AddItemToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :item, null: false, foreign_key: true
  end
end
