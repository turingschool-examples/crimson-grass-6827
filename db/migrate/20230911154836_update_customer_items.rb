class UpdateCustomerItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :customer_items, :items_id, :item_id
    rename_column :customer_items, :customers_id, :customer_id
  end
end
