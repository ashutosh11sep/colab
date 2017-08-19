class CreateStripeTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :stripe_transactions do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :stripe_customer_id
      t.string :stripe_transaction_id
      t.float :amount
      t.string :type

      t.timestamps
    end
  end
end
