module ClarifaiRuby
  class TagImage
    attr_reader :docid,
                :docid_str,
                :url,
                :status_code,
                :status_msg,
                :local_id,
                :tags


    def initialize(result_doc)
      @docid = result_doc["docid"]
      @docid_str = result_doc["docid_str"]
      @url = result_doc["url"]
      @status_code = result_doc["status_code"]
      @status_msg = result_doc["status_msg"]
      @local_id = result_doc["local_id"]
      @tags = generate_tags result_doc["result"]["tag"]
      @tags_by_words = result_doc["result"]["tag"]["classes"]
    end

    private

    def generate_tags(tag_doc)
      concept_ids = tag_doc["concept_ids"]
      classes = tag_doc["classes"]
      probs = tag_doc["probs"]

      tags = []
      if concept_ids
        classes.each_with_index do |c, i|
          tags << Tag.new(c, probs[i], concept_ids[i])
        end
      else
        classes.each_with_index do |c, i|
          tags << Tag.new(c, probs[i])
        end
      end

      tags
    end
  end
end
