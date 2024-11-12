class CreateCustomerPurchase < ActiveRecord::Migration[7.2]
  def change
    create_table :customer_purchases do |t|
      t.integer :customer_id, null: false
      t.integer :purchase_amount_cents, null: false

      t.timestamps
    end
  end
end
