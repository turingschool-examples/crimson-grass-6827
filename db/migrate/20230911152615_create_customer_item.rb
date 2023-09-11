class CreateCustomerItem < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_items do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
