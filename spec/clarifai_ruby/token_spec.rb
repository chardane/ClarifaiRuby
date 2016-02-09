require 'spec_helper'

describe ClarifaiRuby::Token do
  describe "#initialize" do
    let(:configured_base_uri) { ClarifaiRuby.configuration.api_url }

    it "sets the correct base_uri on the class according to the configuration" do
      expect(described_class.new.class.base_uri).to eq configured_base_uri
    end
  end

  describe "#token" do
    let(:token) { "this_is_an_access_token" }
    let(:body) do
      {
        "grant_type" => "client_credentials",
        "client_id" => "#{ClarifaiRuby.configuration.client_id}",
        "client_secret" => "#{ClarifaiRuby.configuration.client_secret}"
      }
    end

    let(:token_response) { double(parsed_response: {'access_token' => token}) }

    before do
      allow(described_class).to receive(:post).with("/token", body: body).and_return token_response
    end

    it "returns the token" do
      expect(described_class.new.token).to eq token
    end
  end
end
