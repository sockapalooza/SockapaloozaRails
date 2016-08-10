class ChangeOrderStatusToInteger < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_statuses, :name, :string
    add_column :order_statuses, :name, :integer
  end
end
