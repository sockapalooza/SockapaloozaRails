class Ordering < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validate :product_present
  validate :order_exists

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

  def product_present
    if product.nil?
      errors.add(:product, "is not available.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is invalid.")
    end
  end

  def finalize_order
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
  
end
