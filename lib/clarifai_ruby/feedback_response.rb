module ClarifaiRuby
  class FeedbackResponse

    attr_reader :status_code, :status_msg

    def initialize(json_response)
      @status_code = json_response["status_code"]
      @status_msg = json_response["status_msg"]
    end
  end
end
