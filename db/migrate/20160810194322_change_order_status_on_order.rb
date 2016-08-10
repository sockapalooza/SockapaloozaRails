class ChangeOrderStatusOnOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :order_status_id, :integer
    add_reference :orders, :order_status, index: true
  end
end
