class HomeController < ApplicationController

  helper_method :getTopProjects


  def index
    projects = Project.all
    @topProj = getTopProjects(projects)

  end

  private
  def getTopProjects(projects)
    return projects.order(rating: :desc).limit(5)
  end
end
