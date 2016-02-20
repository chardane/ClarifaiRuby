module ClarifaiRuby
  class ColorResponse

    attr_reader :status_code, :status_msg, :docid_str, :url, :colors

    def initialize(json_response)
      @status_code = json_response["status_code"]
      @status_msg = json_response["status_msg"]
      @results = json_response["results"][0]
      @docid_str = @results["docid_str"]
      @url = @results["url"]
      @colors = @results["colors"]
    end

    # Color Objects!
  end
end
