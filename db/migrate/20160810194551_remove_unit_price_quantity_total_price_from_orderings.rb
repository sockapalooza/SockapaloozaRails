class RemoveUnitPriceQuantityTotalPriceFromOrderings < ActiveRecord::Migration[5.0]
  def change
    remove_column :orderings, :unit_price, :integer
    remove_column :orderings, :quantity, :integer
    remove_column :orderings, :total_price, :integer
  end
end
