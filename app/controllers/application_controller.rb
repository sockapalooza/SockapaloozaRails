class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_user

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      order = Order.create!
      session[:order_id] = order.id
      order
    end
  end

  def current_user
    if session[:username]
     @current_user ||= User.find_by(username: session[:username])
    end
    @current_user
  end

end
