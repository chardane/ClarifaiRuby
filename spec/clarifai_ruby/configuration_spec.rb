require 'spec_helper'

describe ClarifaiRuby::Configuration do
  let(:default_base_url) { "https://api.clarifai.com" }
  let(:default_version_path) { "/v1" }
  let(:default_api_url) { "https://api.clarifai.com/v1" }

  describe "#initialize" do
    it "sets the default base url" do
      expect(described_class.new.base_url).to eq default_base_url
    end

    it "sets the default version path" do
      expect(described_class.new.version_path).to eq default_version_path
    end

    it "sets a default api url" do
      expect(described_class.new.api_url).to eq default_api_url
    end
  end
end
