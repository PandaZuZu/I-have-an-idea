class AchievementController < ApplicationController
  def new
    if current_user && current_user.isAdmin
      @new_achievement = Achievement.new
    else
      redirect_to root_url
    end
  end

  def create
    @new_achievement = Achievement.new(achievement_params)

    if @new_achievement.save
      redirect_to achievement_show_path, :notice => "Achievement added!"
    else
      render "new"
    end
  end

  def show
    @achievements = Achievement.all
  end

  def destroy
    toDelete = Achievement.find(params[:toDelete])
    toDelete.destroy

    redirect_to achievement_show_path
  end

  private
  def achievement_params
    params.require(:achievement).permit(:title, :description, {pictures: []})
  end

end
