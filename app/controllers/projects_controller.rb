class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if current_user.coins >= -190

     if @project.save
       if current_user.projects.size <1
         @achievement = Achievement.first
          if !current_user.achievements.include?(@achievement)
           current_user.achievements << @achievement
           current_user.update_attribute :coins , current_user.coins + 1000
          end
       end
      current_user.projects << @project
      redirect_to my_project_path
         current_user.update_attribute :coins, current_user.coins - 100
         current_user.save
     else
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
