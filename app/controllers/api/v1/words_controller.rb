class Api::V1::WordsController < Api::V1::BaseController
  def create
    word = Word.create!(tr: params[:tr], en: params[:en], user: current_user, usage: :by_user)
    render json: word.to_json, status: 201
  end
end
