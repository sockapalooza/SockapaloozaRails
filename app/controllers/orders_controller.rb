class OrdersController < ApplicationController

  def show
    @order_items = current_order.orderings
  end

end
