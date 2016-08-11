class ProductsController < ApplicationController

  def index
    @products = Product.all.order(price: :desc)
    # @ordering = current_order.orderings.new
    render json: @products
  end

  def featured
    promo = Promo.pluck(:product_id)
    @promosproduct = Product.where(id: promo)
    @promos = Promo.all
    render json: @promos
  end

  


end
