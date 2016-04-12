class HomeController < ApplicationController

  helper_method :getTopProjects


  def index
    projects = Project.all
    @topProj = getTopProjects(projects)
    @newProj = getNewProjects(projects)
  end

  private
  def getTopProjects(projects)
    return projects.order(rating: :desc).limit(4)
  end

  def getNewProjects(projects)
    return projects.order(created_at: :desc).limit(4)
  end
end
