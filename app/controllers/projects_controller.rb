class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    achievementToShow = Achievement.new
    if current_user.coins >= 10
      if @project.save
        if current_user.projects.size < 1
          @achievement = Achievement.first
          if !current_user.achievements.include?(@achievement)
            current_user.achievements << @achievement
            current_user.update_attribute :coins , current_user.coins + 100
            achievementToShow = @achievement
          end
        end

        current_user.projects << @project
<<<<<<< HEAD

        if achievementToShow != nil
          flash[:achievementToShow] = achievementToShow.title
        end

        #ilieionutcosmin@gmail.com

        redirect_to my_project_path
=======
>>>>>>> 9f4a1fa38a3ce4e1f0191831f82bcf825698f5e5
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
