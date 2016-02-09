module ClarifaiRuby
  class Token
    include HTTParty
    TOKEN_PATH = "/token"

    def initialize
      self.class.base_uri ClarifaiRuby.configuration.api_url
    end

    def token
      @token ||= generate_token
    end

    private

    def generate_token
      body = {
        "grant_type" => "client_credentials",
        "client_id" => "#{ClarifaiRuby.configuration.client_id}",
        "client_secret" => "#{ClarifaiRuby.configuration.client_secret}"
      }

      response = self.class.post(TOKEN_PATH, :body => body).parsed_response
      #TODO handle error case here
      response['access_token']
    end

  end
end
