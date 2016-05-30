class SessionsController < ApplicationController
  def show
    redirect_to root_url
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    if user.is_confirmed
      @coins = 0
      if user && !user.isBanned
        if user.last_day_logged && user.last_day_logged < Date.today
         @coins = give_reward(user)
        end
        session[:user_id] = user.id
        if @coins > 0
          flash[:added] = @coins
          redirect_to root_url
        else
          redirect_to root_url, :notice => "Logged in!"
        end
      else
        if user && user.isBanned
          flash.now.alert = "User is banned"
        else
          flash.now.alert = "Invalid username or password"
        end
          render "new"
      end
    else
      flash.now.alert = "Please confirm your email"
      render "new"
    end
  end

  def give_achievement(user)
    if  user.login_days == 0
       @achievement = Achievement.find(6)
        if !user.achievements.include?(@achievement)
         user.achievements << @achievement
         user.update_attribute :coins , user.coins + 100
         achievementToShow = @achievement
         user.update_attribute :login_days , 1
        end
       if achievementToShow != nil
         @achiev = @achievement
         flash[:achievementToShow] = achievementToShow.title
       end
   end
   if  user.login_days ==7
      @achievement = Achievement.find(5)
       if !user.achievements.include?(@achievement)
        user.achievements << @achievement
        user.update_attribute :coins , user.coins + 100
        achievementToShow = @achievement
       end
      if achievementToShow != nil
        @achiev = @achievement
        flash[:achievementToShow] = achievementToShow.title
      end
    end
  end

  def give_reward(user)
    if user.last_day_logged == Date.today.prev_day
      @coins = 0
      if user.last_day_logged == Date.yesterday
         if user.login_days < 7
           user.update_attribute :login_days, user.login_days + 1
           user.update_attribute :coins, user.coins + user.login_days*10
           @coins = user.login_days * 10
         else
           user.update_attribute :coins, user.coins + 50
           @coins = 50
         end
      else
         user.update_attribute :login_days, 1
         user.update_attribute :coins, user.coins + 10
         @coins = 10
      end
       user.update_attribute :last_day_logged, Date.today
       user.save
       @coins
     end
  end

  def admin_panel
    if current_user == nil
      redirect_to root_url
    end
  end

  def confirmation
    if @user = User.where("username = ?", params[:id]).first
      @user.update_attribute :is_confirmed, true
      @user.save
    else
      flash[:added] = params[:id]
    end

    redirect_to root_url
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
