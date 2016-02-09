require 'spec_helper'

describe ClarifaiRuby::InfoResponse do
  describe "#initialize" do
    let(:results) do
      {
        "max_image_size" => 100000,
        "default_language" => "en",
        "max_video_size" => 100000,
        "max_image_bytes" => 10485760,
        "min_image_size" => 1,
        "default_model" => "general-v1.3",
        "max_video_bytes" => 104857600,
        "max_video_duration" => 1800,
        "max_batch_size" => 128,
        "max_video_batch_size" => 1,
        "min_video_size" => 1,
        "api_version" => 0.1
      }
    end
    let(:response) do
      {
        "status_code" => "OK",
        "status_msg" => "All images in request have completed successfully. ",
        "results" => results
      }
    end

    it "makes an attr_reader for max_image_size" do
      expect(described_class.new(response).max_image_size).to eq results['max_image_size']
    end

    it "makes an attr_reader for default_language" do
      expect(described_class.new(response).max_image_size).to eq results['max_image_size']
    end

    it "makes an attr_reader for max_video_size" do
      expect(described_class.new(response).max_video_size).to eq results['max_video_size']
    end

    it "makes an attr_reader for max_image_bytes" do
      expect(described_class.new(response).max_image_bytes).to eq results['max_image_bytes']
    end

    it "makes an attr_reader for min_image_size" do
      expect(described_class.new(response).min_image_size).to eq results['min_image_size']
    end

    it "makes an attr_reader for default_model" do
      expect(described_class.new(response).default_model).to eq results['default_model']
    end

    it "makes an attr_reader for max_video_bytes" do
      expect(described_class.new(response).max_video_bytes).to eq results['max_video_bytes']
    end

    it "makes an attr_reader for max_video_duration" do
      expect(described_class.new(response).max_video_duration).to eq results['max_video_duration']
    end

    it "makes an attr_reader for max_batch_size" do
      expect(described_class.new(response).max_batch_size).to eq results['max_batch_size']
    end

    it "makes an attr_reader for max_video_batch_size" do
      expect(described_class.new(response).max_video_batch_size).to eq results['max_video_batch_size']
    end

    it "makes an attr_reader for min_video_size" do
      expect(described_class.new(response).min_video_size).to eq results['min_video_size']
    end

    it "makes an attr_reader for api_version" do
      expect(described_class.new(response).max_image_size).to eq results['max_image_size']
    end
  end
end
