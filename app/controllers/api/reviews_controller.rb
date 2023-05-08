class Api::ReviewsController < ApplicationController
  before_action :require_logged_in, only: [:create, :update, :destroy]

  def index
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews.includes(:author)

    render "api/reviews/index"
  end

  def create
    @review = Review.new(review_params)
    @review.author_id = current_user.id
    @review.game_id = params[:game_id]

    if current_user.owns?(Game.find(@review.game_id))
      if @review.save
        render :show
      else
        render json: @review.errors.full_messages, status: 422
      end
    else
      render json: { message: "User does not own this game" }, status: 403
    end
  end

  def update
    @review = Review.find(params[:id])
    @review.assign_attributes(review_params)

    if @review.save!
      render "api/reviews/show"
    else
      render json: { errors: @review.errors.full_messages }, status: :unauthorized
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy if @review
    render json: { message: "success" }
  end

  def review_params
    params.require(:review).permit(:body, :recommended)
  end
end
