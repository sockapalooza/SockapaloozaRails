class Sizing < ApplicationRecord
  belongs_to :size
  belongs_to :product

  def self.checkstock(size_id, product_id, orderamount)
    Sizing.where(product_id: product_id)&.where(size_id: size_id).first.quantity >= orderamount
  end

  def adjuststock(size_id, product_id, orderamount)
    sizing = Sizing.where(product_id: product_id)&.where(size_id: size_id).first
    sizing.quantity = sizing.quantity - orderamount
    sizing.save!
  end

  def admin_display
    size.size + ": " + quantity.to_s
  end


end
