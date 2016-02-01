require 'spec_helper'

describe ClarifaiRuby do
  it 'has a version number' do
    expect(ClarifaiRuby::VERSION).not_to be nil
  end

  describe ".configure" do
    let(:client_id) { "LukeSkywalker" }
    let(:client_secret) { "likes_leia" }
    let(:base_url) { "http://death.star" }
    let(:version_path) { "/v2" }
    let(:expected_api_url) { "http://death.star/v2" }

    before do
      ClarifaiRuby.configure do |config|
        config.base_url = base_url
        config.version_path = version_path
        config.client_id = client_id
        config.client_secret = client_secret
      end
    end

    it "sets the expected api_url" do
      expect(ClarifaiRuby.configuration.api_url).to eq expected_api_url
    end

    it "sets the client_id" do
      expect(ClarifaiRuby.configuration.client_id).to eq client_id
    end

    it "sets the client_secret" do
      expect(ClarifaiRuby.configuration.client_secret).to eq client_secret
    end

    it "sets the version_path" do
      expect(ClarifaiRuby.configuration.version_path).to eq version_path
    end
  end
end
