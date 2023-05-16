class Api::SessionsController < ApplicationController
  def show
    if current_user
      render "api/users/show"
    else
      render json: { user: nil }
    end
  end

  def create
    credentials = params[:credential]
    password = params[:password]
    @user = User.find_by_credentials(credentials, password)

    if @user
      login!(@user)
      render "api/users/show"
    else
      render json: { errors: ["Please check your password and account name and try again."] }, status: :unauthorized
    end
  end

  def destroy
    if current_user
      logout!
    end
  end
end
