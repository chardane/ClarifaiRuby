module ClarifaiRuby
  class RequestError < StandardError; end

  class Client
    include HTTMultiParty
    # debug_output $stderr
    
    disable_rails_query_string_format

    attr_reader :token

    def initialize
      @token = Token.new.token
      self.class.base_uri ClarifaiRuby.configuration.api_url
      self.class.headers auth_header
    end

    def get(url, opts={})
      response = self.class.get(url, query: opts)
      #TODO handle raising any errors here
    end

    def post(url, opts={})
      response = self.class.post(url, query: opts)
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
