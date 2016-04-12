class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_url
    else
      render "new"
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end

end
