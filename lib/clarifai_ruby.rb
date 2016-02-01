require "clarifai_ruby/version"
require 'clarifai_ruby/configuration'
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
end

# Usage
#
# ClarifaiRuby.configure do |config|
#   config.base_url 			= "https://api.clarifai.com"
#   config.version_path 	= "/v1"
#   config.client_id 			= "XDEWESBGHRDEWFGNBV"
#   config.client_secret 	= "-123wedkfjnkj3"
# end
