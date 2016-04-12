class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.projects << @project
      redirect_to my_project_path
    else
      render "new"
    end
  end

  def show
    @my_projects = current_user.projects
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, {pictures: []})
  end

end
