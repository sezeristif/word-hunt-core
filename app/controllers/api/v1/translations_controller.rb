class Api::V1::TranslationsController < Api::V1::BaseController
  def translate
    text = TranslateService.new(translation_params[:q], translation_params[:from], translation_params[:to]).translate
    render json: { translated_text: text }.to_json, status: 200
  end

  def translation_params
    params.require(:translation).permit(:q, :from, :to)
  end
end
