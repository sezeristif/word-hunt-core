class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :doorkeeper_authorize!, only: [:create]

  def me
    render json: current_user.to_json
  end

  def create
    User.create!(user_params)
    render json: { message: :created }.to_json, status: 201
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
