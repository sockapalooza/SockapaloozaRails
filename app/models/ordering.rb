class Ordering < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :size

  validates :quantity, presence: true
  validates :order, presence: true

  def unit_price
      product.price
  end

  def total_price
    unit_price * quantity
  end


end
