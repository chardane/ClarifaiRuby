module ClarifaiRuby
  class InfoRequest
    INFO_PATH = '/info'
    attr_reader :raw_response, :options

    def initialize(opts = {})
      @options = opts
      @client = Client.new
    end

    def get
      @raw_response = @client.get(INFO_PATH, options).parsed_response
      InfoResponse.new(raw_response)
    end
  end
end
