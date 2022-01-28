class Api::V1::UsersController < Api::V1::BaseController
  def me
    render json: current_user.to_json
  end
end
