module ClarifaiRuby
  class Tag
    attr_reader :word, :prob, :concept_id

    def initialize(word, prob, concept_id=nil)
      @word = word
      @prob = prob
      @concept_id = concept_id
    end
  end
end
