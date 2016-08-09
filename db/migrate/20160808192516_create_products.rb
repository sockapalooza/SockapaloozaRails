class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.string :style
      t.string :size
      t.integer :quantity
      t.integer :price
      t.string :image
      t.string :materials
      t.text :description

      t.timestamps
    end
  end
end
