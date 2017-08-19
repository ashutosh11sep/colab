class CreatePayements < ActiveRecord::Migration[5.1]
  def change
    create_table :payements do |t|
      t.string :email
      t.integer :card
      t.integer :exp
      t.integer :cvv

      t.timestamps
    end
  end
end
