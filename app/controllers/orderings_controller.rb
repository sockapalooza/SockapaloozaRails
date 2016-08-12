class OrderingsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @order = current_user.current_order
    if Sizing.checkstock(params[:size_id],params[:product_id],params[:quantity])
      @ordering = @order.orderings.new(ordering_params)
      @ordering.save!
      @order.save!
      adjuststock(params[:size_id],params[:product_id],params[:quantity])
      render json: @order
    else
      render json: {notice: "Sorry, we're now out of stock."}, status: :forbidden
    end
  end

  def update
    @order = current_user.current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.update(ordering_params)
    if Sizing.checkstock(params[:size_id],params[:product_id],params[:quantity])
      adjuststock(params[:size_id],params[:product_id],params[:quantity])
      render json: @order
    else
      render json: {notice: "Sorry, we're now out of stock."}, status: :forbidden
    end
  end

  def destroy
    @order = current_user.current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.destroy
    adjuststock(params[:size_id],params[:product_id],-params[:quantity])
    render json: @order
  end

  private

  def ordering_params
    params.permit(:quantity, :product_id, :size_id, :order_id)
  end
end
