class Api::ReviewsController < ApplicationController
  before_action :require_logged_in, only: [:create, :update, :destroy]

  def index
    @reviews = Review.includes(:author, :review_votes).where(game_id: params[:game_id])
    render "api/reviews/index"
  end

  def create
    @review = Review.new(review_params)
    @review.game_id = params[:game_id]
    @review.author_id = current_user.id

    # Add debugging statements
    puts "Review before save: #{@review.inspect}"

    if @review.author.owns?(@review.game)
      if @review.save
        render :show
      else
        # Add debugging statement for save errors
        puts "Review save errors: #{@review.errors.full_messages}"
        render json: @review.errors.full_messages, status: 422
      end
    else
      render json: ["You must own the game to write a review."], status: 401
    end

    # Add debugging statement for the review after save attempt
    puts "Review after save attempt: #{@review.inspect}"
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
