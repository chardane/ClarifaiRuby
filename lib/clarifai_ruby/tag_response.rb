module ClarifaiRuby
  class TagResponse
    attr_reader :tag_images,
                :status_code,
                :status_msg,
                :meta,
                :model


    def initialize(json_response)
      @tag_images = generate_tag_images json_response["results"]
      @status_code = json_response["status_code"]
      @status_msg = json_response["status_msg"]
      @meta = json_response["meta"]
      @model = json_response["meta"]["tag"]["model"]
    end

    private

    def generate_tag_images(results)
      results.map { |r| TagImage.new(r) }
    end
  end
end
