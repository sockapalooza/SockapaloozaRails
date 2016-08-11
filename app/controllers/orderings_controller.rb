class OrderingsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    @order = current_user.current_order
    @ordering = @order.orderings.new(ordering_params)
    @order.save
    render json: current_user
  end

  def update
    @order = current_user.current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.update(ordering_params)
    render json: current_user
  end

  def destroy
    @order = current_user.current_order
    @ordering = @order.orderings.find(params[:id])
    @ordering.destroy
    render :json current_user
  end

  private

  def ordering_params
    params.require(:ordering).permit(:quantity, :product_id, :size_id)
  end
end
