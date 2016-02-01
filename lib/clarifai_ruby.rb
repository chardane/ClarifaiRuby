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
#   config.client_id = "XDEWESBGHRDEWFGNBV"
#   config.client_secret = "-123wedkfjnkj3"
# end
