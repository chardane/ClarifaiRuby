# module ClarifaiRuby
#   class Client
#     include HTTParty
#     base_uri ClarifaiRuby.configuration.api_url
#
#     def initialize
#       #get access token with client_id and client_secret & put access token in header
#       @token = Token.new
#     end
#
#     def info(opts)
#       # Info.new(opts)
#     end
#
#     def tag(opts)
#       # Tag.new(opts)
#     end
#
#     def feedback(opts)
#       # Feedback.new(opts)
#     end
#
#     def color(opts)
#       # Color.new(opts)
#     end
#   end
# end

# module ClarifaiRuby
#   class TagRequest
#     def initialize
#
#     end
#
#     def client
#       ClarifaiRuby.client
#     end
#   end
# end
#
#
# ClarifaiRuby::TagRequest.new(image_url, options)
# # ClarifaiRuby::TagRequest.new(image_url, options)
# => ClarifaiRuby::TagResponse
# - tags, probs






# ClarifaiRuby::InfoRequest.new(options).get

module ClarifaiRuby
  class InfoRequest
    include httparty
    base_uri ClarifaiRuby::configuration.api_url

    def initialize(options)
      @options = options
      @request_path = "/info"
    end

    def doc_id

    end

    def get
      #do the actual GET
      response = client.get(@request_path, image_url) #something base_uri + request_path
    end

    def post
      #do the actual POST
      response = #something
      response = JSON.parse(response)
      return ClarifaiRuby::InfoResponse.new(response)
    end

    def client
      ClarifaiRuby::Client.new
    end

    private

    def build_request_url

    end

    def get_token
      # go get a token
    end
  end
end

module ClarifaiRuby
  class InfoResponse #parse the json response and make it available
    attr_reader :max_image_size

    def initialize(json_response)
      @raw_response = json_response
      @max_image_size = json_response['results']['max_image_size']
    end
  end
end

# ClarifaiRuby::InfoResponse.new(response)
#
# ClarifaiRuby::Color.new(image_url, options)
# - colors
# ClarifaiRuby::Feedback.new(image_url, options)
# -
# ClarifaiRuby::Info.new(image_url, options)
#
# ClarifaiRuby::Client.tag(kajsndkajsn,kajsndka)
# => ClarifaiRuby::Tag.new status_code, status_message, results, tags, probabilities


# module ClarifaiRuby
#   class Model
#     def status_code
#
#     end
#
#     def status_message
#     end
#
#     def results
#     end
#
#     def doc_id
#     end
#
#     def meta
#     end
#   end
# end
