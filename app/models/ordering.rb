class Ordering < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    product.price * quantity
  end


end
