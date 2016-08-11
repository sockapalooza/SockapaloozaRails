class User < ApplicationRecord
  has_many :orders
  has_many :shippings

   def active_orders
     orders.includes(:order_status).where(order_statuses: {name: ["In Progress", "Billing"]}).order("orders.created_at DESC")
   end

  def current_order
    if active_orders.any?
      active_orders.last
    else
      orders.create!
    end
  end


end
