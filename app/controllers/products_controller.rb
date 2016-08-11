class ProductsController < ApplicationController
  before_action :current_user, only: [:index]

  def index
    @products = Product.all.order(price: :desc)
    render json: @products
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  end


  def featured
    promo = Promo.pluck(:product_id)
    @promosproduct = Product.where(id: promo)
    @promos = Promo.all
    render json: @promos
  end




end
