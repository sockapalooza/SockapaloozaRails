class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
