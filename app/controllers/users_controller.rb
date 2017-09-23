class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to chatrooms_path
    else
      redirect_to new_user_path, flash[:notice] = {:notice => 'Invalid username'}
    end
  end

  private

    def user_params
      params.required(:user).permit(:username)
    end
end
