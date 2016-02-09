require 'spec_helper'

describe ClarifaiRuby::InfoRequest do
  describe "#initialize" do
    it "generates a new client" do
      expect(ClarifaiRuby::Client).to receive(:new)

      described_class.new
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

    context "when there are options passed" do
      let(:opts) { { foo: "bar" } }
      let(:response) { double }
      let(:raw_response) { double(:raw_response, parsed_response: json_response) }
      let(:json_response) { double(:json_response) }
      let(:client) { double(:client) }

      before do
        allow(ClarifaiRuby::Client).to receive(:new).and_return client
        allow(client).to receive(:get).with(described_class::INFO_PATH, opts).and_return raw_response
        allow(ClarifaiRuby::InfoResponse).to receive(:new).with(json_response).and_return response
      end

      it "passes opts to the get request correctly" do
        expect(info_request.get(opts)).to eq response
      end
    end

    context "when there are no options passed" do
      let(:response) { double }
      let(:raw_response) { double(:raw_response, parsed_response: json_response) }
      let(:json_response) { double(:json_response) }
      let(:client) { double(:client) }

      before do
        allow(ClarifaiRuby::Client).to receive(:new).and_return client
        allow(client).to receive(:get).with(described_class::INFO_PATH, {}).and_return raw_response
        allow(ClarifaiRuby::InfoResponse).to receive(:new).with(json_response).and_return response
      end

      it "passes an empty hash to the get request" do
        expect(info_request.get).to eq response
      end
    end
  end
end
