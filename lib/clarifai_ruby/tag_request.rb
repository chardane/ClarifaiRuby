module ClarifaiRuby
  class TagRequest
    TAG_PATH = '/tag'
    attr_reader :raw_response, :options

    def initialize
      @client = Client.new
    end

    def get(image_url, opts={})
      body = {
        url: image_url,
        model: opts[:model]
      }

      build_request!(body, opts)

      @raw_response = @client.get(TAG_PATH, body).parsed_response
      raise RequestError.new @raw_response["status_msg"] if @raw_response["status_code"] != "OK"

      TagResponse.new(raw_response)
    end

    private

    def build_request!(body, opts)
      if opts.has_key? :language
        if body[:model] != "general-v1.3"
          raise RequestError.new "must set model to 'general-v1.3' when using language option"
        end
        body.merge!(language: opts[:language])
      end

      if opts.has_key? :select_classes
        body.merge!(select_classes: opts[:select_classes])
      end
    end
  end
end
