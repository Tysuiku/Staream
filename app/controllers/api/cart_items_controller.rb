class Api::CartItemsController < ApplicationController
  before_action :require_logged_in

  def create
    @cart_item = CartItem.new(user_id: current_user.id, game_id: params[:game_id], purchased: false)

    existing_cart_item = CartItem.find_by(user_id: current_user.id, game_id: params[:game_id])

    if existing_cart_item.nil? || !existing_cart_item.purchased
      if @cart_item.save
        render "api/cart_items/show"
      else
        render json: { errors: @cart_item.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: ["ERROR - cart item already purchased"] }, status: :unprocessable_entity
    end
  end

  def index
    @cart_items = CartItem.includes(:game, :user).where(user_id: current_user.id)
    render "api/cart_items/index"
  end

  def destroy
    if (params[:id] == "all")
      @cart_items = CartItem.where(user_id: current_user.id)
      @cart_items.destroy_all
    else
      @cart_item = CartItem.find(params[:id])
      @cart_item.destroy
    end
    render json: { message: "successful" }
  end

  def checkout
    @cart_items = current_user.cart_items.where(purchased: false)
    @cart_items.each do |cart_item|
      cart_item.update(purchased: true)
    end
    render json: { message: "successful" }
  end
end
