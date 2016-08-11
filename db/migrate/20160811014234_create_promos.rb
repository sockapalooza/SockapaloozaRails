class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.integer :product_id
      t.integer :promo_image_id

      t.timestamps
    end
  end
end
