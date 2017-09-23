class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(user_params)
    if user
      session[:user_id] = user.id
      redirect_to chatrooms_path
    else
      redirect_to login_path, :flash => {:notice => 'Authentication failed'}
    end
  end

  def destroy
  end

  private

    def user_params
      params.required(:user).permit(:username)
    end
end
