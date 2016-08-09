class CreateSizings < ActiveRecord::Migration[5.0]
  def change
    create_table :sizings do |t|
      t.references :size, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
