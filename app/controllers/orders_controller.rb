class OrdersController < ApplicationController

  def show
    @orderings = current_order.orderings
  end

end
