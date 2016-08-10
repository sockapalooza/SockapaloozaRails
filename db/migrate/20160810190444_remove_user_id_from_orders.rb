class RemoveUserIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :user_id, :integer
    add_reference :orders, :user, index: true
  end
end
