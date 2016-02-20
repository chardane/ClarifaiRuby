module ClarifaiRuby
  class ColorRequest
    COLOR_PATH = '/color'
    attr_reader :raw_response, :options

    def initialize
      @client = Client.new
    end

    def get(url)

      query = {
        url: url
      }

      @raw_response = @client.get(COLOR_PATH, query).parsed_response
      ColorResponse.new(raw_response)
    end
  end
end
