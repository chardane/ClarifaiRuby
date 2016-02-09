require 'spec_helper'

describe ClarifaiRuby::InfoRequest do
  describe "#initialize" do
    it "generates a new client" do
      expect(ClarifaiRuby::Client).to receive(:new)

      described_class.new
    end

    context "when there are options passed" do
      let(:opts) { { foo: "bar" } }

      it "passes in opts correctly", :vcr do
        expect(described_class.new(opts).options).to eq opts
      end
    end

    context "when there are no options passed" do
      it "set options equal to an empty hash", :vcr do
        expect(described_class.new.options).to be_empty
      end
    end
  end

  describe "#get" do
    let(:info_request) { described_class.new }

    it "gets the raw response", :vcr do
      info_request.get
      expect(info_request.raw_response).not_to be nil
    end

    it "returns an info response object", :vcr do
      expect(info_request.get).to be_a ClarifaiRuby::InfoResponse
    end
  end
end
