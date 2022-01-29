class Api::V1::BaseController < ApplicationController
  before_action :doorkeeper_authorize!
  protect_from_forgery with: :null_session

  private

  def current_user
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])
  end
end
