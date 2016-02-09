module ClarifaiRuby
  class InfoRequest
    INFO_PATH = '/info'
    attr_reader :raw_response, :options

    def initialize
      @client = Client.new
    end

    def get(opts = {})
      @raw_response = @client.get(INFO_PATH, opts).parsed_response
      InfoResponse.new(raw_response)
    end
  end
end
