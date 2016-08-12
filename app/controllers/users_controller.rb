class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :current_user, only: [:show]


  def create
    if @user = current_user.update!(
    username: params[:username],
    email: params[:email],
    password: params[:password],
    role: "registered"
    )
      current_user.current_order.order_id = @user.id
      current_user.current_order.save!
      session[:id] = @user.id
      UserNotifier.send_signup_email(@user).deliver
      render json: current_user, status: :created
    else
      render json: {error: "did not work"}
    end

  end

  def login
    @user = User.find_by(username: params[:username])
      if @user
        if @user.authenticate(params[:password])
          current_user.current_order.update!(order_id: @user.id)
          session[:id] = @user.id
        else
          # respond_to do |format|
          #   format.json { error: "Invalid Password or Username", status: :unprocessable_entity}
          #   format.html { redirect_back(fallback_location: root_path), flash: "Invalid Password or Username" }
          # end
        end
      else
        # respond_to do |format|
        #   format.json {error: "Invalid Password or Username", status: :unprocessable_entity}
        #   format.html {redirect_back(fallback_location: root_path), flash: "Invalid Password or Username" }
        # end
      end
  end

  def show
    render json: current_user
  end

end
