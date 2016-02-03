
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
#
#     def get
#       query = { "url" => img_url }
#     end
#
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
    include HTTParty
    base_uri 'https://api.clarifai.com'

    def initialize(options)
      @options = options
      @request_path = '/info'
    end

    def get_request_url
      build_request_url
    end

    def get()

      token = get_token
      #do the actual GET
      response = self.class.get(build_request_url,
        :headers => {
          "Authorization" => "Bearer #{token}"
        }
      )
    end
    #
    # def post
    #   #do the actual POST
    #   response = #something
    #   response = JSON.parse(response)
    #   return ClarifaiRuby::InfoResponse.new(response)
    # end
    #
    # def client
    #   ClarifaiRuby::Client.new
    # end
    #
    private
    #
    def build_request_url
      ClarifaiRuby.configuration.api_url + @request_path
    end
    #
    def get_token
      ClarifaiRuby.generate_token
    end
  end
end

module ClarifaiRuby
  class InfoResponse #parse the json response anmake it available
    attr_reader :max_image_size, :default_model, :max_video_size

    def initialize(json_response)
      @raw_response = json_response
      @max_image_size = json_response['results']['max_image_size']
      @max_video_size = json_response['results']['max_video_size']
      @default_model = json_response['results']['default_model']
    end

    def status_code
      # self.get["status_code"]
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
