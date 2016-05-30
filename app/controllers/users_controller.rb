class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.isBanned = false
    @user.last_day_logged = Date.today
    @user.login_days  = 0
    @user.coins = 100

    if User.all.size < 1
      @user.isAdmin = true
    else
      @user.isAdmin = false
    end
    
    require 'net/http'

    stri= "http://www3.conectoo.ro/aero-new/connect2/SendMail?api_key=fyalkjevxivj8qkxtl&email="+@user.username+"&subject=Confirmation&sender_name=FMI&sender_email=fmi@email.com&sender_reply_to=jack.sparrow@email.com&message_content=Please_click_this_link_to_activate_your_account:"+"http://localhost:3000/confirm/"+@user.username+"&is_bulk=false"
    url = URI.parse(stri)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
      }
      puts res.body

    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show_achievement
    @achievements = current_user.achievements
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
