class OrdersController < ApplicationController


  def show
    @orderings = current_order.orderings
    render json: @orderings
  end

end
