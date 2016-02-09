require 'spec_helper'

describe ClarifaiRuby::Client do
  describe "#initialize" do
    let(:configured_base_uri) { ClarifaiRuby.configuration.api_url }

    it "sets the base_uri according to the configuration", :vcr do
      expect(described_class.new.class.base_uri).to eq configured_base_uri
    end

    it "gets a new token", :vcr do
      expect(described_class.new.token).not_to be nil
    end
  end

  describe "#get" do
    let(:url) { "/foo" }
    let(:token) { "this is a token" }
    let(:headers) do
      {
        "Authorization" => "Bearer #{token}"
      }
    end
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
        expect(described_class).to receive(:get).with(url, headers: headers, body: opts).and_return nil

        described_class.new.get(url, opts)
      end
    end
  end
end
