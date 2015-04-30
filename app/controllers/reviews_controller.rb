class ReviewsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_establishment
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.establishment_id = @establishment.id

    if @review.save
      redirect_to @establishment
    else
      render :new
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_establishment
    @establishment = Establishment.find(params[:establishment_id])
  end

  def review_params
    params.require(:review).permit!
  end

end