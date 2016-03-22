module ClarifaiRuby
  class TagImage
    attr_reader :docid,
                :docid_str,
                :url,
                :status_code,
                :status_msg,
                :local_id,
                :tags,
                :tags_by_words


    def initialize(response_doc)
      @docid = response_doc["docid"]
      @docid_str = response_doc["docid_str"]
      @url = response_doc["url"]
      @status_code = response_doc["status_code"]
      @status_msg = response_doc["status_msg"]
      @local_id = response_doc["local_id"]
      @tags = generate_tags response_doc["result"]["tag"]
      @tags_by_words = response_doc["result"]["tag"]["classes"]
    end

    private

    def generate_tags(tag_doc)
      tags = tag_doc["classes"].zip(tag_doc["probs"], tag_doc["concept_ids"] || [])
      tags.map{ |tag| Tag.new(*tag) }
    end
  end
end
