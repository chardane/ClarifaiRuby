require 'spec_helper'

describe ClarifaiRuby::FeedbackRequest do
  describe "#initialize" do
    it "generates a new client" do
      expect(ClarifaiRuby::Client).to receive(:new)

      described_class.new
    end
  end

  # describe "#add_tags"
  #   let(:feedback_request) { described_class.new }
  #
  #   it "raises error when no feedback input given" do
  #     expect(feedback_request.add_tags).not_to be nil
  #   end
  # end
end
