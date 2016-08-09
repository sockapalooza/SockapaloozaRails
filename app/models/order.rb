class Order < ApplicationRecord
  belongs_to :order_status
  has_many :orderings
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    orderings.collect{|orderings| orderings.quantity * orderings.unit_price}.sum
  end

  private

  def set_order_status
    self.order_status_id = "In Progress"
  end

  def update_subtotal
    self[:price] = price
  end

end
