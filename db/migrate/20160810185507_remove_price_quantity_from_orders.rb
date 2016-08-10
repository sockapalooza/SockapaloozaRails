class RemovePriceQuantityFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :quantity, :integer
    remove_column :orders, :price, :integer
  end
end
