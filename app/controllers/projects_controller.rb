class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if current_user.coins >= 100
      if @project.save
      give_achievement(current_user)
        current_user.projects << @project
        redirect_to my_project_path(@achiev)
        current_user.update_attribute :coins, current_user.coins - 100
        current_user.save
      else
        flash.now.alert = "cant save"
        render "new"
      end
    else
      flash.now.alert = "Insufficent coins"
      render "new"
    end
  end

 def give_achievement(current_user)
  achievementToShow = Achievement.new
   if current_user.projects.size < 1
     if @achievement = Achievement.where("title like ?", "%Getting started%").first
       if !current_user.achievements.include?(@achievement)
         current_user.achievements << @achievement
         current_user.update_attribute :coins , current_user.coins + 100
         achievementToShow = @achievement
       end
     end
   end
   if current_user.projects.size == 1
     @achievement = Achievement.find(2)
     if !current_user.achievements.include?(@achievement)
       current_user.achievements << @achievement
       current_user.update_attribute :coins , current_user.coins + 100
       achievementToShow = @achievement
     end
   end
   if current_user.projects.size == 2
     @achievement = Achievement.find(3)
     if !current_user.achievements.include?(@achievement)
       current_user.achievements << @achievement
       current_user.update_attribute :coins , current_user.coins + 100
       achievementToShow = @achievement
     end
   end
   if achievementToShow != nil
     @achiev = @achievement
     flash[:achievementToShow] = achievementToShow.title
   end
 end
  def show
    if current_user == nil
      redirect_to root_url
    else
      @my_projects = current_user.projects
    end
  end

  def edit
    @project = Project.find(params[:toEdit])
  end

  def update

  end

  def viewproject
    @current_project = Project.find(params[:toFind])
    @review = Review.new
  end

  def destroy
    project = Project.find(params[:toDelete])
    project.destroy

    redirect_to root_url
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, {pictures: []})
  end

end
