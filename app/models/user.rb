class User < ApplicationRecord
  has_many :orders
  has_many :shippings

  def current_order
    if
      orders.includes(:order_status).where("order_statuses.name IN ?", ["In Progress", "Billing"]).order("order.created_at DESC").last
    else
      order = Order.create!
    end

  end


end
