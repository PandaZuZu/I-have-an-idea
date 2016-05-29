class ReviewController < ApplicationController

  def create
    @review = Review.new(user_params)
    if @review.save
      current_project = Project.find(params[:toFind])
      current_project.reviews << @review
      current_user.reviews << @review

      redirect_to projects_viewproject_path(toFind: params[:toFind]), :notice => "Review created"
    else
      render projects_viewproject_path
    end
  end

  def destroy
  end

  def user_params
    params.require(:review).permit(:title, :content)
  end
end
