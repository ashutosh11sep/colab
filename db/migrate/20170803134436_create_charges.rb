class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.string :email
      t.integer :card
      t.integer :exp
      t.integer :cvc

      t.timestamps
    end
  end
end
