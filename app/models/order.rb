class Order < ApplicationRecord
  belongs_to :order_status
  has_many :orderings
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    orderings.collect{|orderings| oi.valid? ? (orderings.quantity * orderings.unit_price):0}.sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
