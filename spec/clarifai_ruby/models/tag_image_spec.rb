require 'spec_helper'

describe ClarifaiRuby::TagImage do
  describe "#initialize" do
    subject { described_class.new(response_doc) }
    let(:response_doc) do
      {
        "docid" => 1234567,
        "docid_str" => "abc123",
        "url" => "http://hogwarts.wiz",
        "status_code" => "OK",
        "status_msg" => "OK",
        "local_id" => "buyfreshandlocal",
        "result" => {
          "tag" => {
            "concept_ids" => [
              "ai_HLmqFqBf",
              "ai_fvlBqXZR",
              "ai_Xxjc3MhT",
              "ai_6kTjGfF6",
            ],
            "classes" => [
              "train",
              "railway",
              "transportation system",
              "station",
            ],
            "probs" => [
              0.9989112019538879,
              0.9975532293319702,
              0.9959157705307007,
              0.9925730228424072,
            ]
          }
        }
      }
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

    it "sets tags as Tag objects" do
      subject.tags.each do |tag|
        expect(tag).to be_a ClarifaiRuby::Tag
      end
    end

    it "sets the correct words" do
      subject.tags.each_with_index do |tag, i|
        expect(tag.word).to eq response_doc["result"]["tag"]["classes"][i]
      end
    end

    it "sets the correct probs" do
      subject.tags.each_with_index do |tag, i|
        expect(tag.prob).to eq response_doc["result"]["tag"]["probs"][i]
      end
    end

    it "sets the correct probs" do
      subject.tags.each_with_index do |tag, i|
        expect(tag.concept_id).to eq response_doc["result"]["tag"]["concept_ids"][i]
      end
    end
  end
end
