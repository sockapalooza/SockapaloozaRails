class ChangeTypetoCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :type, :category
  end
end
