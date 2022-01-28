class TranslateService
  def initialize(text, source, target)
    @text = text
    @source = source
    @target = target
    @url = ENV['GOOGLE_CLOUD_TRANSLATE_API_URL']
    @token = ENV['GOOGLE_CLOUD_TRANSLATE_API_KEY']

  end

  def translate
    response = HTTParty.post(@url,
                             body: body.to_json,
                             headers: { 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@token}" })
    JSON.parse(response.body).deep_symbolize_keys[:data][:translations][0][:translatedText]
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