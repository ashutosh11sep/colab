class AddUserIdToPayements < ActiveRecord::Migration[5.1]
  def change
    add_column :payements, :user_id, :integer
  end
end
