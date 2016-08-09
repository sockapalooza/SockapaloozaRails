class Ordering < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true

  before_save :finalize_order

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def finalize_order
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
