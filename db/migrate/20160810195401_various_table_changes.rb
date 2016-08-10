class VariousTableChanges < ActiveRecord::Migration[5.0]
  def change
    remove_column :sizes, :quantity, :integer
    add_column :sizings, :quantity, :integer
    change_column :order_statuses, :name, :string
  end
end
