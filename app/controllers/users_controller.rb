class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.isBanned = false

    @user.last_day_logged = Date.today
    @user.login_days  = 7
    @user.coins = 110

    if User.all.size < 1
      @user.isAdmin = true
    else
      @user.isAdmin = false
    end

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
