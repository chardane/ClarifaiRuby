require "clarifai_ruby/version"
require 'clarifai_ruby/configuration'
require 'clarifai_ruby/client'
require 'httparty'

module ClarifaiRuby
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration
  end

  def self.generate_token
    body = {
      "grant_type" => "client_credentials",
      "client_id" => "#{@configuration.client_id}",
      "client_secret" => "#{@configuration.client_secret}"
    }

    response = HTTParty.post(@configuration.api_url + "/token", :body => body).parsed_response
    @configuration.token = response['access_token']
  end
end

# Usage
#
# ClarifaiRuby.configure do |config|
#   config.base_url 			= "https://api.clarifai.com"
#   config.version_path 	= "/v1"
#   config.client_id 			= "XDEWESBGHRDEWFGNBV"
#   config.client_secret 	= "-123wedkfjnkj3"
# end
