class AddQuantityBackToOrderings < ActiveRecord::Migration[5.0]
  def change
    add_column :orderings, :quantity, :integer
  end
end
