class ProductsController < ApplicationController

  def index
    @products = Product.all.order(price: :desc)
    @ordering = current_order.orderings.new
    render json: @products, @ordering
  end

  def filterresults
    filter = params[:filter].split(", ")
    

end
