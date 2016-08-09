class AddColumnsToOrderings < ActiveRecord::Migration[5.0]
  def change
    add_column :orderings, :unit_price, :integer
    add_column :orderings, :quantity, :integer
    add_column :orderings, :total_price, :integer
  end
end
