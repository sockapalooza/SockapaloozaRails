class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user, only: [:show]


  def create
    @user = current_user
    if @user.update(
    username: params[:username],
    email: params[:email],
    password: params[:password],
    role: "registered"
    )
      UserNotifierMailer.send_signup_email(@user).deliver
      render json: current_user, status: :created
    else
      render json: {error: "did not work"}
    end

  end

  def login
    @user = User.find_by(username: params[:username])
      if @user
        if @user.authenticate(params[:password])
          current_user.current_order.update(user_id: @user.id)
          session[:id] = @user.id
        else
          render json: {error: "Incorrect username or password."}
        end
      else
        render json: {error: "Incorrect username or password."}
      end
      render json: current_user
  end

  def show
    render json: current_user
  end

end
