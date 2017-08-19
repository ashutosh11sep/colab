class AddPostIdToPayements < ActiveRecord::Migration[5.1]
  def change
    add_column :payements, :post_id, :integer
  end
end
