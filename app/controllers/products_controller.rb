class ProductsController < ApplicationController

  def index
    @products = Product.all.order(price: :desc)
    @ordering = current_order.orderings.new
    render json: @products
  end

end
