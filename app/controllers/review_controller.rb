class ReviewController < ApplicationController
  def new
    @review=Review.new
  end

  def create
    @review = Review.new(user_params)
    if @review.save
      redirect_to root_url, :notice => "review created"
    else
      render "new"
    end
  end

  def destroy
  end

  def user_params
    params.require(:review).permit(:title, :content)
  end
end
