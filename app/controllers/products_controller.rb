class ProductsController < ApplicationController

  def index
    @products = Product.all.order(price: :desc)
    # @ordering = current_order.orderings.new
    render json: @products
  end

  def featured
    @promos = Promo.all
    render json: @promos
  end

end
