require 'spec_helper'

describe ClarifaiRuby::Tag do
  describe "#initialize" do
    let(:word) { "unicorn" }
    let(:prob) { 0.98 }
    let(:concept_id) { "ai_unicorn" }
    
    subject { described_class.new(word, prob, concept_id) }

    it 'sets word' do
      expect(subject.word).to eq word
    end

    it 'sets prob' do
      expect(subject.prob).to eq prob
    end

    it 'sets concept_id' do
      expect(subject.concept_id).to eq concept_id
    end
  end
end
