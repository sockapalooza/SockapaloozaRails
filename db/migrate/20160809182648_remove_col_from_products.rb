class RemoveColFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :size, :string
    remove_column :products, :quantity, :integer
  end
end
