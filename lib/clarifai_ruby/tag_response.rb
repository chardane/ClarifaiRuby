module ClarifaiRuby
  class TagResponse
    attr_reader :tag_creatives,
                :status_code,
                :status_msg,
                :meta,
                :model


    def initialize(json_response)
      results = json_response["results"]

      @tag_creatives = generate_tag_creatives results
      @status_code = json_response["status_code"]
      @status_msg = json_response["status_msg"]
      @meta = json_response["meta"]
      @model = json_response["meta"]["tag"]["model"]
    end

    private

    def is_video?(payload)
      payload["result"]["tag"].has_key?("timestamps")
    end

    def generate_tag_creatives(results)
      results.map do |r|
        if is_video?(r)
          TagVideo.new(r)
        else
          TagImage.new(r)
        end
      end
    end
  end
end
