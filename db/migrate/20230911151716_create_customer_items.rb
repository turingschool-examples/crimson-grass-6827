class CreateCustomerItems < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_items do |t|
      t.references :customers, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
