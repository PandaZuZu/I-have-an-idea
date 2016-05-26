class SessionsController < ApplicationController
  def show
    redirect_to root_url
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user && !user.isBanned
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      if user && user.isBanned
        flash.now.alert = "User is banned"
      else
        flash.now.alert = "Invalid username or password"
      end
        render "new"
    end
  end

  def admin_panel
    if current_user == nil
      redirect_to root_url
    end
  end

  def password_changed
    if params[:password] != params[:password_confirmation]
      flash.now.alert = "Password confirmation does not match"
    else
      current_user.password = params[:password]

      if current_user.save
        flash.now.alert = "Password changed"
      else
        flash.now.alert = "Could not change password"
      end
    end
    render 'admin_panel'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
