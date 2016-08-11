class OrderingsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def create
    @ordering = Ordering.new(
    product_id: params[:product_id],
    quantity: params[:quanity]
    
    )

  end

  def update
  end

  def destroy
  end

  private

  def ordering_params
    params.require(:ordering).permit(:quantity, :product_id)
  end
end
