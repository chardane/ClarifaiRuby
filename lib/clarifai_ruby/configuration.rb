module ClarifaiRuby
  class Configuration
    attr_accessor :base_url, :client_id, :client_secret, :version_path

    def initialize
      @base_url = 'https://api.clarifai.com'
      @version_path = '/v1'
    end

    def api_url
      base_url + version_path
    end
  end
end
