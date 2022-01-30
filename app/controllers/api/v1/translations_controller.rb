class Api::V1::TranslationsController < Api::V1::BaseController
  def translate
    text = TranslateService.new(params[:q], params[:from], params[:to]).translate
    render json: { translated_text: text }.to_json, status: 200
  end
end
