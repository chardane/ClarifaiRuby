module ClarifaiRuby
  class InfoResponse

    def initialize(json_response, recursion=0)
      #parse the json response and make each key available
      json_response.each do |name, value|
        if value.is_a? Hash
          initialize(value, recursion+1)
        else
          self.class.send(:attr_reader, name)
          instance_variable_set("@#{name}", value)
        end
      end
    end
  end
end
