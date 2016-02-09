module ClarifaiRuby
  class Client
    include HTTParty

    attr_reader :token

    def initialize
      self.class.base_uri ClarifaiRuby.configuration.api_url
      @token = Token.new.token
    end

    def get(url, opts={})
      response = self.class.get(url, headers: auth_header, body: opts)
      #TODO handle raising any errors here
    end

    def post(url, opts={})
      response = self.class.post(url, headers: auth_header, body: opts)
      #TODO handle raising any errors here
    end

    private

    def auth_header
      {
        "Authorization" => "Bearer #{token}"
      }
    end
  end
end
