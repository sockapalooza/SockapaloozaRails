class Order < ApplicationRecord
  belongs_to :order_status
  has_many :orderings
  before_validation :set_order_status, on: :create
  before_save :update_subtotal

  def quantity
    orderings.sum(:quantity)
  end

  def subtotal
    orderings.collect{|orderings| orderings.total_price}.sum
  end

  def shipping_price
    if quantity >= 5
      6
    else
      quantity * 4
    end
  end

  def taxes
    subtotal * 0.06
  end

  def total
    subtotal + shipping_price + taxes
  end

  private

  def set_order_status
    order_status_id = 1
  end

end
