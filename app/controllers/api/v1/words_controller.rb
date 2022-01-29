class Api::V1::WordsController < Api::V1::BaseController
  def create
    word = Word.create!(tr: params[:tr], en: params[:en], user: current_user, usage: :user)
    render json: word.to_json, status: 201
  end

  def random_word
    random_word = Word.where(usage: :common).order('RANDOM()').first
    render json: random_word.to_json, status: 200
  end
end
