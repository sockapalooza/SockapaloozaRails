class OrdersController < ApplicationController


  def show
    @order = current_user.current_order
    render json: @order, serializer: OrderSerializer
  end

  def checkout
    @order = current_user.current_order
    @order.update!(order_status_id: 2)
    render json: @order, serializer: CheckoutSerializer
  end

end
