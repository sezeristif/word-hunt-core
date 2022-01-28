require 'google/cloud/translate'

class TranslateService
  def initialize(q, from, to)
    @q = q
    @to = to
    @from = from
    @client = Google::Cloud::Translate.new(
      version: :v2,
      key: ENV['GOOGLE_CLOUD_TRANSLATE_API_KEY']
    )
  end

  def translate
    @client.translate(@q, from: @from, to: @to).text
  end

  def body
    {
      "q": @text,
      "source": @source,
      "target": @target,
      "format": 'text'
    }
  end
end
