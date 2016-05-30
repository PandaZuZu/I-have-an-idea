class ReviewController < ApplicationController

  def create
    @review = Review.new(user_params)
    if @review.save
      current_project = Project.find(params[:toFind])
      current_project.reviews << @review
      current_user.reviews << @review
      if current_project.rating != nil
        current_project.update_attribute :rating, (current_project.rating.to_f + params[:rating].to_f) /2
      else
        current_project.update_attribute :rating, params[:rating]
      end

      current_project.save

      redirect_to projects_viewproject_path(toFind: params[:toFind]), :notice => "Review created"
    else
      redirect_to projects_viewproject_path(toFind: params[:toFind])
    end
  end

  def destroy
  end

  def user_params
    params.require(:review).permit(:title, :content)
  end
end
