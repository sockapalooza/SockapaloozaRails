class OrderingsController < ApplicationController
  def create
    @order = current_order
    @ordering = @order.orderings.new(ordering_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.update(ordering_params)
    @ordering = @order.orderings
  end

  def destroy
    @order = current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.destroy
    @ordering = @order.orderings
  end

  private

  def ordering_params
    params.require(:ordering).permit(:quantity, :product_id)
  end    
end
