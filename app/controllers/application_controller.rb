class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  def current_user
    if session[:id]
     @current_user ||= User.find(session[:id])
    else
     @current_user = User.create!
     @current_user.current_order
     session[:id] = @current_user.id
     @current_user
    end
    @current_user
  end

  def adjuststock(size_id, product_id, orderamount)
    sizing = Sizing.where(product_id: product_id).where(size_id: size_id).first
    sizing.quantity = sizing.quantity - orderamount
    sizing.save!
  end

  def increasestock(size_id, product_id, orderamount)
    sizing = Sizing.where(product_id: product_id).where(size_id: size_id).first
    sizing.quantity = sizing.quantity + orderamount
    sizing.save!
  end


end
