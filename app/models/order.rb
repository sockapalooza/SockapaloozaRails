class Order < ApplicationRecord
  belongs_to :order_status
  has_many :orderings
  before_validation :set_order_status, on: :create

  def quantity
    orderings.sum(:quantity)
  end

  def subtotal
    orderings.collect{|orderings| orderings.total_price}.sum
  end

  def shipping_price
    if quantity >= 5
      600
    else
      quantity * 400
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
    self.order_status = OrderStatus.find_by(name: 'In Progress')
  end

end
