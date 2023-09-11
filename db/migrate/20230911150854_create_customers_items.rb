class CreateCustomersItems < ActiveRecord::Migration[7.0]
  def change
    create_table :customers_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
