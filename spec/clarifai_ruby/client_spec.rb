require 'spec_helper'

describe ClarifaiRuby::Client do
  describe "#initialize" do
    let(:configured_base_uri) { ClarifaiRuby.configuration.api_url }
    let(:token_response) { double(token: "this_is_a_token") }
    let(:header) do
      {
        "Authorization" => "Bearer #{token_response.token}"
      }
    end

    before do
      allow(ClarifaiRuby::Token).to receive(:new).and_return token_response
    end

    it "sets the base_uri according to the configuration", :vcr do
      expect(described_class.new.class.base_uri).to eq configured_base_uri
    end

    it "sets the default header" do
      expect(described_class.new.class.headers).to eq header
    end

    it "gets a new token" do
      expect(described_class.new.token).to eq token_response.token
    end
  end

  describe "#get" do
    let(:url) { "/foo" }
    let(:token) { "this is a token" }
    let(:token_object) { double(token: token) }

    before do
      allow(ClarifaiRuby::Token).to receive(:new).and_return token_object
    end

    context "when there is an opts hash given" do
      let(:opts) do
        {
          foo: "bar"
        }
      end

      it "sends the request with the given URL" do
        expect(described_class).to receive(:get).with(url, query: opts)

        described_class.new.get(url, opts)
      end
    end
  end

  describe "#post" do
    let(:url) { "/foo" }
    let(:token_object) { double(token: "this is a token") }

    before do
      allow(ClarifaiRuby::Token).to receive(:new).and_return token_object
    end

    context "when there is an opts hash given" do
      let(:opts) do
        {
          foo: "bar"
        }
      end

      it "sends the request with the given URL" do
        expect(described_class).to receive(:post).with(url, query: opts)

        described_class.new.post(url, opts)
      end
    end
  end
end
