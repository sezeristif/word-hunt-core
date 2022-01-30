class Api::V1::BaseController < ApplicationController
  before_action :doorkeeper_authorize!

  protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  private

  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id]) if doorkeeper_token
  end

  def unprocessable_entity_response(exception)
    render json: {errors: exception.record.errors}, status: :unprocessable_entity
  end

  def not_found_response(exception)
    render json: {errors: exception.record.errors}, status: :not_found
  end
end
