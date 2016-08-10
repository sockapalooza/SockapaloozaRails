class Order < ApplicationRecord
  belongs_to :order_status
  has_many :orderings
  before_validation :set_order_status, on: :create
  before_save :update_subtotal

  def subtotal
    orderings.collect{|orderings| orderings.quantity * orderings.unit_price}.sum
  end

  private

  def set_order_status
    self.order_status = OrderStatus.find_or_create_by(name: "In Progress")
  end

  def update_subtotal
    self[:price] = price
  end

end
