require 'spec_helper'

describe ClarifaiRuby::TagVideo do
  describe "#initialize" do
    subject { described_class.new(response_doc) }

    let(:response_doc) do
      JSON.parse(File.read('spec/fixtures/video_response.json'))["results"].first
    end

    it "sets docid" do
      expect(subject.docid).to eq response_doc["docid"]
    end

    it "sets docid_str" do
      expect(subject.docid_str).to eq response_doc["docid_str"]
    end

    it "sets url" do
      expect(subject.url).to eq response_doc["url"]
    end

    it "sets status_code" do
      expect(subject.status_code).to eq response_doc["status_code"]
    end

    it "sets status_msg" do
      expect(subject.status_msg).to eq response_doc["status_msg"]
    end

    it "sets local_id" do
      expect(subject.local_id).to eq response_doc["local_id"]
    end

    it "sets tags_by_words" do
      expect(subject.tags_by_words).to eq response_doc["result"]["tag"]["classes"]
    end

    it "sets tags as array of Tag objects for each second of the video" do
      subject.tags.each do |tag|
        expect(tag).to be_a Array
        expect(tag.first).to be_a ClarifaiRuby::Tag
      end
    end

    it "sets the correct words" do
      subject.tags.each_with_index do |tags_by_second, i|
        tags_by_second.each_with_index do |tag, j|
          expect(tag.word).to eq response_doc["result"]["tag"]["classes"][i][j]
        end
      end
    end

    it "sets the correct probs" do
      subject.tags.each_with_index do |tags_by_second, i|
        tags_by_second.each_with_index do |tag, j|
          expect(tag.prob).to eq response_doc["result"]["tag"]["probs"][i][j]
        end
      end
    end

    it "sets the correct probs" do
      subject.tags.each_with_index do |tags_by_second, i|
        tags_by_second.each_with_index do |tag, j|
          expect(tag.concept_id).to eq response_doc["result"]["tag"]["concept_ids"][i][j]
        end
      end
    end
  end
end
