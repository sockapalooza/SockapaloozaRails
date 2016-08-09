class AddOrderStatusIdToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_status_id, :string
  end
end
