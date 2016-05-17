module ClarifaiRuby
  class FeedbackRequest
    FEEDBACK_PATH = '/feedback'
    attr_reader :raw_response, :options

    def initialize
      @client = Client.new
    end

    def add_tags(url, input)

      if input.empty?
        raise "Empty Feedback Argument"
      else
        query = {
          url: url,
          add_tags: input.join(',')
        }

        @raw_response = @client.post(FEEDBACK_PATH, query).parsed_response
        FeedbackResponse.new(raw_response)
      end
    end

    def remove_tags(url, input)
      if input.empty?
        raise "Empty Feedback Argument"
      else
        query = {
          url: url,
          remove_tags: input.join(',')
        }

        @raw_response = @client.post(FEEDBACK_PATH, query).parsed_response
        FeedbackResponse.new(raw_response)
      end
    end

    def similar(url, input)
      if input.empty?
        raise "Empty Feedback Argument"
      else
        query = {
          url: url,
          similar_docids: input.join(',')
        }

        @raw_response = @client.post(FEEDBACK_PATH, query).parsed_response
        FeedbackResponse.new(raw_response)
      end
    end

    def dissimilar(url, input)
      if input.empty?
        raise "Empty Feedback Argument"
      else
        query = {
          url: url,
          dissimilar_docids: input.join(',')
        }

        @raw_response = @client.post(FEEDBACK_PATH, query).parsed_response
        FeedbackResponse.new(raw_response)
      end
    end


  end
end
