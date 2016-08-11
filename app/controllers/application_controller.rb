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

end
