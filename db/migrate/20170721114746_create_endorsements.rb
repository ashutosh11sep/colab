class CreateEndorsements < ActiveRecord::Migration[5.1]
  def change
    create_table :endorsements do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :text

      t.timestamps
    end
  end
end
