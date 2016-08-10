class UsersController < ApplicationController

  def create
    @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
    )
    if @user.save
      session[:username] = @user.username
      redirect_to root_path
      respond_to do |format|
        format.json {render @user, status: :created}
        format.html {redirect_to root_path}
        end
    else
      respond_to do |format|
        format.json {render @user.errors.full_messages, status: :unprocessable_entity}
        format.html {redirect_back(fallback_location: root_path), flash: {@user.errors}}
      end
    end
  end

  def login
    @user = User.find_by(username: params[:username])
      if @user
        if @user.authenticate(params[:password])
          session[:username] = @user.username
          redirect_to root_path
        else
          respond_to do |format|
            format.json {error: "Invalid Password or Username", status: :unprocessable_entity}
            format.html {redirect_back(fallback_location: root_path), flash: {danger: "Invalid Password or Username"} }
          end
        end
      else
        respond_to do |format|
          format.json {error: "Invalid Password or Username", status: :unprocessable_entity}
          format.html {redirect_back(fallback_location: root_path), flash: {danger: "Invalid Password or Username"} }
        end
      end
  end

end
