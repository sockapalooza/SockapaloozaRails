class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :price
      t.integer :quantity
      t.integer :user_id

      t.timestamps
    end
  end
end
