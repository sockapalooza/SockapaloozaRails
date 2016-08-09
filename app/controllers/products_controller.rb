class ProductsController < ApplicationController

  def index
    @products = Product.all.order(price: :desc)
    @ordering = current_order.orderings.new
  end

end
